#############################################################
# This pass transforms the expression tree ending with
# lowering from 192 vector, to a appropriate bitwidth
#
# For non saturation arithmetic (extration from 192bits),
# estimate the proper bitwidth
#  (define %5 (extract  %4 %1 b))
#  (define %6 (sign-extend  %5 (bitvector 192)))
#  (define %11 (extract  %10 %7 c))
#  (define %12 (sign-extend  %11 (bitvector 192)))
#  (define %14 (bvsub  %6  %12))
#  (define %15 (integer->bitvector (abs (bitvector->integer %14)) (bitvector 192))) #* Entry
#  (define %16 (extract  15 0 %15)) #* FinalExtract
# ->
#  (define %5 (extract  %4 %1 b))
#  (define %6 (sign-extend  %5 (bitvector 32)))
#  (define %11 (extract  %10 %7 c))
#  (define %12 (sign-extend  %11 (bitvector 32)))
#  (define %14 (bvsub  %6  %12))
#  (define %15 (integer->bitvector (abs (bitvector->integer %14)) (bitvector 32))) #* root
#  (define %16 (extract  15 0 %15)) #* NewExtract
#
# For saturation arithmetic (bvsat from 192bits): force the
# bitwidth to be same as the output
#  (define %5 (extract  %4 %1 a))
#  (define %6 (sign-extend  %5 (bitvector 192)))
#  (define %11 (extract  %10 %7 b))
#  (define %12 (sign-extend  %11 (bitvector 192)))
#  (define %13 (bvadd  %6  %12)) #* Entry
#  (define %18 (bvssat %13 192 16 )) #* FinalSat
# ->
#  (define %5 (extract  %4 %1 a))
#  (define %11 (extract  %10 %7 b))
#  (define %13 (bvadd  %6  %12)) #* root
#  (define %18 (bvssat %13 16 16 )) #* NewSat
# Some arithmetic are not designed for saturation, like shl and shr.
# Once they are involved, we need to do the same thing as non-saturation:
#   Replace 192 with needed bitwidth and replace the final sat
#############################################################
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseContext import *
from RoseUtilities import *


def Rectify(x: int):
    allowed = [8, 16, 32, 64, 128]
    for i in allowed:
        if x <= i:
            return i
    assert False, x


class OpTreeExplorer:
    def __init__(self, Context: RoseContext):
        self.Visited = []
        self.InputBits = 0
        self.Context = Context
        self.HeteroOp = False
        self.ZeroExtend = False
        self.SignExtend = False

    def ArithWidth(self, OldBV: RoseValue):
        if isinstance(OldBV, RoseArgument):
            BW = OldBV.getType().getBitwidth()
            self.InputBits = max(self.InputBits, BW)
        elif isinstance(OldBV, RoseBVExtractSliceOp):
            BW = OldBV.getOutputBitwidth()
            self.InputBits = max(self.InputBits, BW)
        elif isinstance(OldBV, RoseConstant):
            BW = OldBV.getValue().bit_length()
            self.InputBits = max(self.InputBits, BW)
        elif isinstance(OldBV, RoseBVSSaturateOp) or isinstance(OldBV, RoseBVUSaturateOp):
            BW = OldBV.getOutputBitwidth()
            self.InputBits = max(self.InputBits, BW)
        else:
            self.Visited.append(OldBV)
            if isinstance(OldBV, RoseBVSignExtendOp) or isinstance(OldBV, RoseBVZeroExtendOp):
                # Leaf
                if isinstance(OldBV, RoseBVSignExtendOp):
                    self.SignExtend = True
                else:
                    self.ZeroExtend = True
                BW = self.ArithWidth(OldBV.getOperand(0))
            else:
                L = [self.ArithWidth(x) for x in OldBV.getOperands()]
                if isinstance(OldBV, RoseBVAbsOp) or isinstance(OldBV, RoseBVNegOp):
                    assert len(L) == 1
                    BW = L[0]+1
                elif isinstance(OldBV, RoseBVAddOp) or isinstance(OldBV, RoseBVSubOp):
                    assert len(L) == 2
                    if self.Context.isValueSigned(OldBV.getOperand(0)) != self.Context.isValueSigned(OldBV.getOperand(1)):
                        self.HeteroOp = True
                    BW = max(L[0], L[1])+1
                elif isinstance(OldBV, RoseBVMulOp):
                    assert len(L) == 2
                    BW = L[0]+L[1]
                elif isinstance(OldBV, RoseBVSmaxOp) or isinstance(OldBV, RoseBVSminOp) or \
                        isinstance(OldBV, RoseBVUmaxOp) or isinstance(OldBV, RoseBVUminOp):
                    assert len(L) == 2
                    BW = max(L[0], L[1])
                elif isinstance(OldBV, RoseBVShlOp):
                    assert len(L) == 2
                    BW = L[0]+32
                elif isinstance(OldBV, RoseBVAshrOp) or isinstance(OldBV, RoseBVLshrOp):
                    assert len(L) == 2
                    BW = max(L[0], L[1])
                else:
                    assert False, OldBV
        print("ArithWidth For", OldBV, "is", BW)
        return BW

    def getVisited(self):
        return self.Visited


def ResetArithBitwidth(Final: RoseValue, Context: RoseContext, FinalBW: int):
    """
    0. Rewrite the expression tree until extract
    1. Insert new Ops with certain BW
    2. Erase the useless ones.
    """
    if type(Final) == RoseBVExtractSliceOp:
        Entries = [Final.getInputBitVector()]
    elif type(Final) == RoseBVUSaturateOp or type(Final) == RoseBVSSaturateOp:
        Entries = [Final.getInputBitVector()]
    elif isinstance(Final, RoseComparisonBitVectorOp):
        Entries = Final.getOperands()
    else:
        assert False, Final
    nodesToRemove = []
    signednessInfo = []
    # new_nodes = []

    def Rebuild(OldBV: RoseOperation, Context: RoseContext, FinalBW: int):
        if isinstance(OldBV, RoseConstant):
            return RoseConstant.create(OldBV.getValue(), RoseBitVectorType.create(FinalBW))
        nodesToRemove.append(OldBV)
        if isinstance(OldBV, RoseBVSignExtendOp) or isinstance(OldBV, RoseBVZeroExtendOp):
            signednessInfo.append(isinstance(OldBV, RoseBVSignExtendOp))
            iBV = OldBV.getInputBitVector()
            if iBV.getType().getBitwidth() == FinalBW:
                # nodes.append(OldBV)
                return iBV
            NewOp = type(OldBV).create(
                Context.genName(OldBV.getName() + ".downcasted"), iBV, FinalBW)
        else:
            L = [Rebuild(x, Context, FinalBW) for x in OldBV.getOperands()]
            if isinstance(OldBV, RoseBVAbsOp) or isinstance(OldBV, RoseBVNegOp):
                NewOp = type(OldBV).create(
                    Context.genName(OldBV.getName() + ".downcasted"), L[0])
            elif isinstance(OldBV, RoseBVAddOp) or isinstance(OldBV, RoseBVSubOp) or \
                    isinstance(OldBV, RoseBVMulOp) or \
                    isinstance(OldBV, RoseBVSmaxOp) or isinstance(OldBV, RoseBVSminOp) or \
                    isinstance(OldBV, RoseBVUmaxOp) or isinstance(OldBV, RoseBVUminOp):
                NewOp = type(OldBV).create(
                    Context.genName(OldBV.getName() + ".downcasted"), L)
            elif isinstance(OldBV, RoseBVShlOp):
                NewOp = type(OldBV).create(
                    Context.genName(OldBV.getName() + ".downcasted"), L[0], L[1])
            elif isinstance(OldBV, RoseBVAshrOp) or isinstance(OldBV, RoseBVLshrOp):
                NewOp = type(OldBV).create(
                    Context.genName(OldBV.getName() + ".downcasted"), L[0], L[1])
            else:
                assert False, OldBV
        # new_nodes.append(NewOp)
        print("Adding:", NewOp, "Before:", OldBV)
        print("Add to", hex(id(OldBV.getParent())))

        OldBV.getParent().addOperationBefore(NewOp, OldBV)
        return NewOp

    roots = [Rebuild(Entry, Context, FinalBW) for Entry in Entries]

    # for node in new_nodes:
    #     print("Adding:", node)
    #     Block.addOperationBefore(node, OldBv)
    print("Root:", roots)
    if type(Final) == RoseBVExtractSliceOp:
        root = roots[0]
        if isinstance(root, RoseBVExtractSliceOp) and root.getOutputBitwidth() == FinalBW:
            # If original slice has equal bitwidth, we just use it without extra extract
            NewExtract = root
        else:
            NewExtract = RoseBVExtractSliceOp.create(Context.genName(
                Final.getName()+".downcasted"), root, Final.getLowIndex(), Final.getHighIndex(), Final.getOperand(Final.getBitwidthPos()))
            Final.getParent().addOperationBefore(NewExtract, Final)
    elif type(Final) == RoseBVUSaturateOp or type(Final) == RoseBVSSaturateOp:
        root = roots[0]
        NewExtract = type(Final).create(Context.genName(
            Final.getName()+".downcasted"), root, Final.getSaturationSize())

        Final.getParent().addOperationBefore(NewExtract, Final)
    elif isinstance(Final, RoseComparisonBitVectorOp):
        LT = [RoseBVULTOp, RoseBVSLTOp]
        GT = [RoseBVUGTOp, RoseBVSGTOp]
        LE = [RoseBVULEOp, RoseBVSLEOp]
        GE = [RoseBVUGEOp, RoseBVSGEOp]
        TypeMap = {
            RoseBVULTOp: LT,
            RoseBVSLTOp: LT,
            RoseBVUGTOp: GT,
            RoseBVSGTOp: GT,
            RoseBVULEOp: LE,
            RoseBVSLEOp: LE,
            RoseBVUGEOp: GE,
            RoseBVSGEOp: GE,
        }
        Signed = signednessInfo[0]
        assert all([x == Signed for x in signednessInfo])
        NewExtract = TypeMap.get(type(Final), [type(Final), type(Final)])[Signed].create(Context.genName(
            Final.getName()+".downcasted"), roots[0], roots[1])

        Final.getParent().addOperationBefore(NewExtract, Final)
    else:
        assert False, Final
    print("Replace Final:", Final, "with:", NewExtract)
    Final.replaceUsesWith(NewExtract)
    Final.getParent().eraseOperation(Final)
    for node in nodesToRemove:
        print("Erasing:", node)
        if type(node.getParent()) != RoseUndefRegion:
            node.getParent().eraseOperation(node)


def ReplaceNonSat(FinalExtract: RoseBVExtractSliceOp, Context: RoseContext):
    Entry = FinalExtract.getInputBitVector()

    FinalBW = OpTreeExplorer(Context).ArithWidth(Entry)
    assert type(FinalExtract.getHighIndex()) == RoseConstant
    FinalBW = max(FinalBW, FinalExtract.getHighIndex().getValue()+1)
    FinalBW = Rectify(FinalBW)
    print(f"{FinalBW = }")
    ResetArithBitwidth(FinalExtract, Context, FinalBW)


def ReplaceCmp(FinalCmp: RoseComparisonBitVectorOp, Context: RoseContext):
    Entries = FinalCmp.getOperands()
    FinalBW = 0
    for Entry in Entries:
        BW = OpTreeExplorer(Context).ArithWidth(Entry)
        FinalBW = max(FinalBW, BW)
    FinalBW = Rectify(FinalBW)
    print(f"{FinalBW = }")
    ResetArithBitwidth(FinalCmp, Context, FinalBW)


def ReplaceSat(FinalSat: RoseBVSSaturateOp | RoseBVUSaturateOp, Context: RoseContext):
    Entry = FinalSat.getInputBitVector()
    assert type(FinalSat.getSaturationSize()) == RoseConstant
    TargetBit = FinalSat.getSaturationSize().getValue()

    OTE = OpTreeExplorer(Context)
    # If all leaves bits <= TargetBit, just do
    FinalBW = OTE.ArithWidth(Entry)

    def criteria():
        if type(Entry) == RoseBVZeroExtendOp or type(Entry) == RoseBVSignExtendOp:
            return False
        if OTE.HeteroOp:
            print("HeteroOp")
            return False
        if OTE.InputBits > TargetBit:
            print("InputBits > TargetBit")
            return False
        for node in OTE.getVisited():
            if type(node) in [RoseBVLshrOp, RoseBVAshrOp, RoseBVShlOp, RoseBVAbsOp, RoseBVNegOp]:
                print("Found lshr/ashr/shl")
                return False
        return True
    if criteria():
        print("All leaves bits <= TargetBit, go ahead")
        print(f"{TargetBit = }")
        ResetArithBitwidth(FinalSat, Context, TargetBit)
    else:
        print("Can't transform to inplace saturation")

        FinalBW = max(FinalBW, FinalSat.getOutputBitwidth())
        FinalBW = Rectify(FinalBW)
        if type(Entry) == RoseBVZeroExtendOp or type(Entry) == RoseBVSignExtendOp:
            FinalBW = max(FinalBW, 2*OTE.InputBits)
        print(f"{FinalBW = }")
        ResetArithBitwidth(FinalSat, Context, FinalBW)


def RunArithTransformOnBlock(Block: RoseBlock, Context: RoseContext):
    print("RUN ARITH TRANSFORM ON BLOCK")
    print("BLOCK:")
    print(Block)
    Block.print()

    nonsat = []
    sat = []
    cmp = []
    for Operation in Block:
        if isinstance(Operation, RoseBVExtractSliceOp):
            iBV = Operation.getInputBitVector()
            if iBV.getType().getBitwidth() == 192:
                nonsat.append(Operation)
        elif isinstance(Operation, RoseBVUSaturateOp) or isinstance(Operation, RoseBVSSaturateOp):
            iBV = Operation.getInputBitVector()
            if iBV.getType().getBitwidth() == 192:
                sat.append(Operation)
        elif isinstance(Operation, RoseComparisonBitVectorOp):
            iBV = Operation.getOperands()
            if iBV[0].getType().getBitwidth() == 192:
                assert iBV[1].getType().getBitwidth() == 192
                cmp.append(Operation)

    for op in nonsat:
        ReplaceNonSat(op, Context)
    for op in sat:
        ReplaceSat(op, Context)
    for op in cmp:
        ReplaceCmp(op, Context)

    # Operation.replaceUsesWith(FinalExtract)


def RunArithTransformOnRegion(Region, Context: RoseContext):
    # Iterate over all the contents of this function
    assert not isinstance(Region, RoseBlock)
    for Abstraction in Region:
        # Run op simplification on a nested function
        if isinstance(Abstraction, RoseFunction):
            RunArithTransformOnFunction(Abstraction, Context)
            continue
        # Op simplification only happens on blocks
        if not isinstance(Abstraction, RoseBlock):
            print("REGION:")
            print(Abstraction)
            Abstraction.print()
            RunArithTransformOnRegion(Abstraction, Context)
            continue
        RunArithTransformOnBlock(Abstraction, Context)


def RunArithTransformOnFunction(Function: RoseFunction, Context: RoseContext):
    print("RUN ON OP COMBINE FUNCTION")
    print("FUNCTION:")
    # Context.Function = Function
    Function.print()
    # Run op simplification on the given function
    RunArithTransformOnRegion(Function, Context)


def Run(Function: RoseFunction, Context: RoseContext):
    RunArithTransformOnFunction(Function, Context)
    print("\n\n\n\n\n")
    Function.print()
    # breakpoint()
