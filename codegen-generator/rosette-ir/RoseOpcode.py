##############################################################
#
# This file contains all the opcodes of all operations
# supported in the  Rosette IR.
#
##############################################################


from RoseTypes import *
from RoseValue import RoseValue
import RoseAbstractions
import RoseValues

from enum import Enum, auto


# List of all operations that
# involve bitvectors.
class RoseOpcode(Enum):
    # Bitvector ops
    bvadd = auto()
    bvsub = auto()
    bvmul = auto()
    bvsdiv = auto()
    bvudiv = auto()
    bvsrem = auto()
    bvurem = auto()
    bvsmod = auto()
    bvsmin = auto()
    bvumin = auto()
    bvsmax = auto()
    bvumax = auto()
    bveq = auto()
    bvslt = auto()
    bvult = auto()
    bvsle = auto()
    bvule = auto()
    bvsgt = auto()
    bvugt = auto()
    bvsge = auto()
    bvuge = auto()
    bvnot = auto()
    bvand = auto()
    bvor = auto()
    bvxor = auto()
    bvshl = auto()
    bvlshr = auto()
    bvashr = auto()
    bvneg = auto()
    bvzero = auto()
    bvrol = auto()
    bvror = auto()
    bit = auto()
    lsb = auto()
    msb = auto()
    bvadd1 = auto()
    bvsub1 = auto()
    rotateleft = auto()
    rotateright = auto()
    bvextract = auto()
    bvsignextend = auto()
    bvzeroextend = auto()
    bvsizeextend = auto()

    # Some primitive ops
    add = auto()
    sub = auto()
    mul = auto()
    div = auto()
    mod = auto()
    rem = auto()
    max = auto()
    min = auto()
    abs = auto()
    equal = auto()
    lessthan = auto()
    lessthanequal = auto()
    greaterthan = auto()
    greaterthanequal = auto()
    not_ = auto()
    and_ = auto()
    nand = auto()
    or_ = auto()
    nor = auto()
    xor = auto()

    # This op has no direct convertion to Rosette
    # but important for SSA representation in IR.
    bvinsert = auto()
    bvconcat = auto()

    # Some important IR ops
    select = auto()
    call = auto()
    ret = auto()

    # And IR opcode for casting between
    # Integers, bitvectors and booleans.
    cast = auto()

    # Ops to represent saturation
    bvssat = auto()
    bvusat = auto()
    bvsaturate = auto()

    # Some general saturable operations
    bvgeneraladd = auto()
    bvgeneralsub = auto()

    # Some general sign-agnostic operations
    bvgeneraldiv = auto()
    bvgeneralrem = auto()
    bvgeneralmax = auto()
    bvgeneralmin = auto()

    # Some general comparison operations
    bvgenerallt = auto()
    bvgeneralle = auto()
    bvgeneralgt = auto()
    bvgeneralge = auto()

    # Racket/Rosette doesn't have these ops
    # but its convenient to have them here.
    bvneq = auto()
    notequal = auto()

    # Ops to represent truncation
    bvtrunclow = auto()
    bvtrunchigh = auto()

    # Add an op for absolute value for bitvectors
    bvabs = auto()

    # Add an op for population count for bitvectors
    bvpopcnt = auto()

    # Op useful for code generation. The callee for this
    # does not have to be defined.
    opaquecall = auto()

    # Op to represent padding of high bits with
    # zeros. This is important for semantics represented
    # using Rose IR.
    bvpadhighbits = auto()
    
    # todo: col-based counterparts?
    mtxinsertel = auto()
    mtxinsertrow = auto()
    mtxextractrow = auto()

    def __str__(self):
        return self.name

    def __eq__(self, Other):
        assert isinstance(Other, RoseOpcode)
        return self.value == Other.value

    def __ne__(self, Other):
        assert isinstance(Other, RoseOpcode)
        return self.value != Other.value

    def __hash__(self):
        return hash(self.value)

    def getBVOpInputs(self, Inputs: list):
        BVInputs = []
        for Input in Inputs:
            assert isinstance(Input, RoseValue), Input
            if isinstance(Input.getType(), RoseBitVectorType):
                BVInputs.append(Input)
        return BVInputs

    def getOutputType(self, Inputs: list, OpInfoBundle=None):
        # Deal with some special cases first.
        if self.value == self.call.value:
            # OpInfoBundle in this case is a callee
            Callee = OpInfoBundle
            assert isinstance(Callee, RoseAbstractions.RoseFunction)
            return Callee.getType().getReturnType()
        if self.value == self.opaquecall.value:
            # OpInfoBundle contains output type and callee name
            assert isinstance(OpInfoBundle, tuple)
            OutputType = OpInfoBundle[0]
            CalleeName = OpInfoBundle[1]
            assert isinstance(CalleeName, RoseValues.RoseConstant)
            assert isinstance(OutputType, RoseType)
            return OutputType
        if self.value == self.cast.value:
            assert (len(Inputs) == 1)
            assert isinstance(Inputs[0], RoseValue)
            # Output type must be explicitly mentioned
            OutputType = OpInfoBundle
            print("OutputType:")
            print(OutputType)
            assert isinstance(OutputType, RoseType)
            assert not isinstance(OutputType, RoseUndefinedType)
            assert Inputs[0].getType() != OutputType
            assert Inputs[0].getType().getBitwidth(
            ) == OutputType.getBitwidth()
            assert (isinstance(OutputType, RoseBooleanType)
                    or isinstance(OutputType, RoseBitVectorType)
                    or isinstance(OutputType, RoseIntegerType))
            return OutputType
        # Output type for all ops can be determined with the help
        # of the types of the inputs. No other OpInfoBundle needed.
        assert OpInfoBundle == None
        # All ops have at least one operand
        assert (len(Inputs) >= 1)
        if self.value == self.bit.value \
                or self.value == self.lsb.value \
                or self.value == self.msb.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert (len(BVInputs) == 1)
            return RoseBitVectorType.create(1)
        if self.value == self.bvzero.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert (len(BVInputs) == 1)
            return RoseBooleanType.create()
        if self.value == self.bvneg.value \
                or self.value == self.bvnot.value \
                or self.value == self.bvadd1.value \
                or self.value == self.bvsub1.value \
                or self.value == self.rotateleft.value \
                or self.value == self.rotateright.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert (len(BVInputs) == 1)
            return RoseBitVectorType.create(BVInputs[0].getType().getBitwidth())
        if self.value == self.bvadd.value \
                or self.value == self.bvsub.value \
                or self.value == self.bvmul.value \
                or self.value == self.bvgeneraladd.value \
                or self.value == self.bvgeneralsub.value \
                or self.value == self.bvor.value \
                or self.value == self.bvxor.value \
                or self.value == self.bvand.value \
                or self.value == self.bvshl.value \
                or self.value == self.bvlshr.value \
                or self.value == self.bvashr.value \
                or self.value == self.bvsmin.value \
                or self.value == self.bvumin.value \
                or self.value == self.bvsmax.value \
                or self.value == self.bvumax.value \
                or self.value == self.bvgeneralmax.value \
                or self.value == self.bvgeneralmin.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert (len(BVInputs) > 1)
            return RoseBitVectorType.create(BVInputs[0].getType().getBitwidth())
        if self.value == self.bvconcat.value:
            BVInputs = self.getBVOpInputs(Inputs)
            return RoseBitVectorType.create(BVInputs[0].getType().getBitwidth()+BVInputs[1].getType().getBitwidth())
        if self.value == self.bvsdiv.value \
                or self.value == self.bvudiv.value \
                or self.value == self.bvsrem.value \
                or self.value == self.bvurem.value \
                or self.value == self.bvsmod.value \
                or self.value == self.bvgeneraldiv.value \
                or self.value == self.bvgeneralrem.value \
                or self.value == self.bvrol.value \
                or self.value == self.bvror.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert (len(BVInputs) == 2)
            return RoseBitVectorType.create(BVInputs[0].getType().getBitwidth())
        if self.value == self.bveq.value \
                or self.value == self.bvneq.value \
                or self.value == self.bvslt.value \
                or self.value == self.bvult.value \
                or self.value == self.bvsle.value \
                or self.value == self.bvule.value \
                or self.value == self.bvsgt.value \
                or self.value == self.bvugt.value \
                or self.value == self.bvsge.value \
                or self.value == self.bvuge.value \
                or self.value == self.bvgenerallt.value \
                or self.value == self.bvgeneralle.value \
                or self.value == self.bvgeneralgt.value \
                or self.value == self.bvgeneralge.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert (len(BVInputs) == 2)
            return RoseBooleanType.create()
        if self.value == self.bvinsert.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert (len(BVInputs) == 2)
            # The bitwidth inserted by is a constant value
            assert isinstance(Inputs[4], RoseValues.RoseConstant)
            return RoseVoidType.create()
        if self.value == self.mtxinsertel.value:
            # `mtxinsertel <elements> <tile> <r1> <c1> <r2> <c2>`
            assert self.inputsAreValid(Inputs)
            return RoseVoidType.create()
        if self.value == self.mtxinsertrow.value:
            # `mtxinsertrow <elements> <tile> <idx>`
            assert self.inputsAreValid(Inputs)
            return RoseVoidType.create()
        if self.value == self.mtxextractrow.value:
            # `mtxextractrow <tile> <idx>`
            assert self.inputsAreValid(Inputs)
            tile, idx = Inputs
            tile_t = tile.getType()
            return RoseBitVectorType.create(
                tile_t.getElementBitwidth() * tile_t.getMaxCols())
        if self.value == self.bvpadhighbits.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert (len(BVInputs) == 1)
            # The number of high bits that should be padded must be constant
            assert isinstance(Inputs[1], RoseValues.RoseConstant)
            return RoseVoidType.create()
        if self.value == self.select.value:
            assert Inputs[1].getType() == Inputs[2].getType()
            return Inputs[1].getType()
        if self.value == self.ret.value:
            assert len(Inputs) == 1
            return RoseVoidType.create()
        if self.value == self.bvextract.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert (len(BVInputs) == 1)
            assert Inputs[1].getType() == Inputs[2].getType()
            # TODO: This is temporary. This needs to be fixed.
            # assert isinstance(Inputs[1], RoseConstant)
            # assert isinstance(Inputs[2], RoseConstant)
            # Bitwidth = (Inputs[2].getValue() - Inputs[1].getValue() + 1)
            assert isinstance(Inputs[3], RoseValues.RoseConstant)
            return RoseBitVectorType.create(Inputs[3].getValue())
        if self.value == self.bvsignextend.value \
                or self.value == self.bvzeroextend.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert (len(BVInputs) == 1)
            assert isinstance(Inputs[1], RoseValues.RoseConstant)
            assert Inputs[1].getValue() > BVInputs[0].getType().getBitwidth()
            return RoseBitVectorType.create(Inputs[1].getValue())
        if self.value == self.bvsizeextend.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert (len(BVInputs) == 1)
            assert isinstance(Inputs[1], RoseValues.RoseConstant)
            assert isinstance(Inputs[2], RoseValues.RoseConstant)
            assert Inputs[1].getValue() > BVInputs[0].getType().getBitwidth()
            return RoseBitVectorType.create(Inputs[1].getValue())
        if self.value == self.bvssat.value \
                or self.value == self.bvusat.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert (len(BVInputs) == 1)
            assert isinstance(Inputs[1], RoseValues.RoseConstant)
            assert Inputs[1].getValue() <= BVInputs[0].getType().getBitwidth()
            return RoseBitVectorType.create(Inputs[1].getValue())
        if self.value == self.bvsaturate.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert (len(BVInputs) == 1)
            assert isinstance(Inputs[1], RoseValues.RoseConstant)
            assert isinstance(Inputs[2], RoseValues.RoseConstant)
            assert Inputs[1].getValue() <= BVInputs[0].getType().getBitwidth()
            return RoseBitVectorType.create(Inputs[1].getValue())
        if self.value == self.bvtrunclow.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert (len(BVInputs) == 1)
            assert isinstance(Inputs[1], RoseValues.RoseConstant)
            assert Inputs[1].getValue() < BVInputs[0].getType().getBitwidth()
            return RoseBitVectorType.create(Inputs[1].getValue())
        if self.value == self.bvtrunchigh.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert (len(BVInputs) == 1)
            assert isinstance(Inputs[1], RoseValues.RoseConstant)
            assert Inputs[1].getValue() < BVInputs[0].getType().getBitwidth()
            return RoseBitVectorType.create(Inputs[1].getValue())
        if self.value == self.add.value \
                or self.value == self.sub.value \
                or self.value == self.mul.value \
                or self.value == self.min.value \
                or self.value == self.max.value:
            assert (len(Inputs) > 1)
            if isinstance(Inputs[0].getType(), RoseIntegerType):
                return RoseIntegerType.create(Inputs[0].getType().getBitwidth())
            assert Inputs[0].getType().isFloatTy()
            return RoseFloatType.create(Inputs[0].getType().getBitwidth())
        if self.value == self.div.value \
                or self.value == self.rem.value \
                or self.value == self.mod.value:
            assert (len(Inputs) == 2)
            if isinstance(Inputs[0].getType(), RoseIntegerType) \
                    and isinstance(Inputs[1].getType(), RoseIntegerType):
                return RoseIntegerType.create(Inputs[0].getType().getBitwidth())
            assert Inputs[0].getType().isFloatTy(
            ) or Inputs[1].getType().isFloatTy()
            return RoseFloatType.create(Inputs[0].getType().getBitwidth())
        if self.value == self.abs.value:
            assert (len(Inputs) == 1)
            assert isinstance(Inputs[0].getType(), RoseIntegerType)
            return RoseIntegerType.create(Inputs[0].getType().getBitwidth())
        if self.value == self.equal.value \
                or self.value == self.notequal.value \
                or self.value == self.lessthan.value \
                or self.value == self.lessthanequal.value \
                or self.value == self.greaterthan.value \
                or self.value == self.greaterthanequal.value:
            assert (len(Inputs) == 2)
            return RoseBooleanType.create()
        if self.value == self.not_.value:
            assert (len(Inputs) == 1)
            if isinstance(Inputs[0].getType(), RoseIntegerType):
                return RoseIntegerType.create(Inputs[0].getType().getBitwidth())
            assert isinstance(Inputs[0].getType(), RoseBooleanType)
            return RoseBooleanType.create()
        if self.value == self.and_.value \
                or self.value == self.nand.value \
                or self.value == self.or_.value \
                or self.value == self.nor.value:
            assert (len(Inputs) > 1)
            InputType = Inputs[0].getType()
            for Input in Inputs[1:]:
                assert Input.getType() == InputType
            if isinstance(Inputs[0].getType(), RoseIntegerType):
                return RoseIntegerType.create(Inputs[0].getType().getBitwidth())
            assert isinstance(Inputs[0].getType(), RoseBooleanType)
            return RoseBooleanType.create()
        if self.value == self.xor.value:
            assert (len(Inputs) == 2)
            if isinstance(Inputs[0].getType(), RoseIntegerType):
                return RoseIntegerType.create(Inputs[0].getType().getBitwidth())
            assert isinstance(Inputs[0].getType(), RoseBooleanType)
            return RoseBooleanType.create()
        if self.value == self.bvabs.value:
            assert (len(Inputs) == 1)
            assert isinstance(Inputs[0].getType(), RoseBitVectorType)
            return RoseBitVectorType.create(Inputs[0].getType().getBitwidth())

        if self.value == self.bvpopcnt.value:
            assert (len(Inputs) == 1)
            assert isinstance(Inputs[0].getType(), RoseBitVectorType)
            return RoseBitVectorType.create(Inputs[0].getType().getBitwidth())
        return None

    def inputsAreValid(self, Inputs: list, OutputType: RoseType, OpInfoBundle=None):
        if self.isValidNumInputs(len(Inputs)) == False:
            return False
        # First deal with some special cases
        if self.value == self.cast.value:
            if len(Inputs) != 1:
                return False
            if not isinstance(Inputs[0], RoseValue):
                return False
            # If the types of inputs are equal, then this operation is not Valid
            if Inputs[0].getType() == OutputType:
                return False
            # Valid input types are integers, bitvectors and booleans
            if not (isinstance(Inputs[0].getType(), RoseBooleanType)
                    or isinstance(Inputs[0].getType(), RoseBitVectorType)
                    or isinstance(Inputs[0].getType(), RoseIntegerType)):
                return False
            if not (isinstance(OutputType, RoseBooleanType)
                    or isinstance(OutputType, RoseBitVectorType)
                    or isinstance(OutputType, RoseIntegerType)):
                return False
            if Inputs[0].getType().getBitwidth() != OutputType.getBitwidth():
                return False
            if self.getOutputType(Inputs, OpInfoBundle) != OutputType:
                return False
            return True
        if self.value == self.call.value:
            print("OpInfoBundle:")
            print(OpInfoBundle)
            Callee = OpInfoBundle#[0]
            if not isinstance(Callee, RoseAbstractions.RoseFunction):
                return False
            if len(Inputs) != Callee.getNumArgs():
                return False
            for Index in range(Callee.getNumArgs()):
                Arg = Callee.getArg(Index)
                if Arg.getType() != Inputs[Index].getType():
                    return False
            if self.getOutputType(Inputs, OpInfoBundle) != OutputType:
                return False
            return True
        if self.value == self.opaquecall.value:
            assert isinstance(OpInfoBundle, tuple)
            CalleeName = OpInfoBundle[1]
            if not isinstance(CalleeName, RoseValues.RoseConstant):
                return False
            if not isinstance(CalleeName.getType(), RoseStringType):
                return False
            if self.getOutputType(Inputs, OpInfoBundle) != OutputType:
                return False
            return True
        # OpInfoBundle is not useful for other operations
        assert OpInfoBundle == None
        if self.value == self.bvzero.value \
                or self.value == self.bit.value \
                or self.value == self.lsb.value \
                or self.value == self.msb.value \
                or self.value == self.bvneg.value \
                or self.value == self.bvnot.value \
                or self.value == self.bvadd1.value \
                or self.value == self.bvsub1.value \
                or self.value == self.rotateleft.value \
                or self.value == self.rotateright.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if self.getOutputType(Inputs) != OutputType:
                return False
            if len(BVInputs) != 1:
                return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.bvextract.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if not isinstance(Inputs[3], RoseValues.RoseConstant):
                return False
            if len(BVInputs) != 1:
                return False
            if BVInputs[0].getType().getBitwidth() < Inputs[3].getValue():
                return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.bvinsert.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if not isinstance(Inputs[4], RoseValues.RoseConstant):
                return False
            if len(BVInputs) != 2:
                return False
            if BVInputs[0].getType().getBitwidth() != Inputs[4].getValue():
                return False
            if BVInputs[1].getType().getBitwidth() < Inputs[4].getValue():
                return False
            # if self.getOutputType(Inputs) != OutputType:  # ARM Hotfix: Don't know what is it doing here
            #     return False
            return True
        if self.value == self.bvsignextend.value \
                or self.value == self.bvzeroextend.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if not isinstance(Inputs[1], RoseValues.RoseConstant):
                return False
            if Inputs[1].getValue() <= BVInputs[0].getType().getBitwidth():
                return False
            if len(BVInputs) != 1:
                return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.bvsizeextend.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if not isinstance(Inputs[1], RoseValues.RoseConstant):
                return False
            if not isinstance(Inputs[2], RoseValues.RoseConstant):
                return False
            if Inputs[1].getValue() <= BVInputs[0].getType().getBitwidth():
                return False
            if len(BVInputs) != 1:
                return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.bvssat.value \
                or self.value == self.bvusat.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if not isinstance(Inputs[1], RoseValues.RoseConstant):
                return False
            if Inputs[1].getValue() > BVInputs[0].getType().getBitwidth():
                return False
            if len(BVInputs) != 1:
                return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.bvsaturate.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if not isinstance(Inputs[1], RoseValues.RoseConstant):
                return False
            if not isinstance(Inputs[2], RoseValues.RoseConstant):
                return False
            if Inputs[1].getValue() > BVInputs[0].getType().getBitwidth():
                return False
            if len(BVInputs) != 1:
                return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.bvtrunclow.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if not isinstance(Inputs[1], RoseValues.RoseConstant):
                return False
            if Inputs[1].getValue() >= BVInputs[0].getType().getBitwidth():
                return False
            if len(BVInputs) != 1:
                return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.bvtrunchigh.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if not isinstance(Inputs[1], RoseValues.RoseConstant):
                return False
            if Inputs[1].getValue() >= BVInputs[0].getType().getBitwidth():
                return False
            if len(BVInputs) != 1:
                return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.bvadd.value \
                or self.value == self.bvsub.value \
                or self.value == self.bvmul.value \
                or self.value == self.bvor.value \
                or self.value == self.bvxor.value \
                or self.value == self.bvand.value \
                or self.value == self.bvshl.value \
                or self.value == self.bvlshr.value \
                or self.value == self.bvashr.value \
                or self.value == self.bvsmin.value \
                or self.value == self.bvumin.value \
                or self.value == self.bvsmax.value \
                or self.value == self.bvumax.value \
                or self.value == self.bvconcat.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if len(BVInputs) <= 0:
                return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.bvgeneralmax.value \
                or self.value == self.bvgeneralmin.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if len(BVInputs) < 2:
                return False
            if not isinstance(Inputs[-1], RoseValues.RoseConstant):
                return False
            if not isinstance(Inputs[-1].getType(), RoseBooleanType):
                return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.bvgeneraladd.value \
                or self.value == self.bvgeneralsub.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if len(BVInputs) < 2:
                return False
            if not isinstance(Inputs[-1], RoseValues.RoseConstant):
                return False
            if not isinstance(Inputs[-1].getType(), RoseIntegerType):
                return False
            if Inputs[-1].getType().getBitwidth() != 2:
                return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.bvsdiv.value \
                or self.value == self.bvudiv.value \
                or self.value == self.bvsrem.value \
                or self.value == self.bvurem.value \
                or self.value == self.bvsmod.value \
                or self.value == self.bvrol.value \
                or self.value == self.bvror.value \
                or self.value == self.bveq.value \
                or self.value == self.bvneq.value \
                or self.value == self.bvslt.value \
                or self.value == self.bvult.value \
                or self.value == self.bvsle.value \
                or self.value == self.bvule.value \
                or self.value == self.bvsgt.value \
                or self.value == self.bvugt.value \
                or self.value == self.bvsge.value \
                or self.value == self.bvuge.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if len(BVInputs) != 2:
                return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.bvgeneraldiv.value \
                or self.value == self.bvgeneralrem.value \
                or self.value == self.bvgenerallt.value \
                or self.value == self.bvgeneralle.value \
                or self.value == self.bvgeneralgt.value \
                or self.value == self.bvgeneralge.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if len(BVInputs) != 2:
                return False
            if not isinstance(Inputs[-1], RoseValues.RoseConstant):
                return False
            if not isinstance(Inputs[-1].getType(), RoseBooleanType):
                return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.bvpadhighbits.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if len(BVInputs) != 1:
                return False
            if not isinstance(Inputs[1], RoseValues.RoseConstant):
                return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.ret.value:
            assert isinstance(Inputs[0], RoseValue)
            if len(Inputs) != 1:
                return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.add.value \
                or self.value == self.sub.value \
                or self.value == self.mul.value \
                or self.value == self.min.value \
                or self.value == self.max.value:
            if not (len(Inputs) > 1):
                return False
            Type = Inputs[0].getType()
            for Input in Inputs:
                if Type != Input.getType():
                    return False
                if not isinstance(Input.getType(), RoseIntegerType) \
                        and not isinstance(Input.getType(), RoseFloatType):
                    return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.div.value \
                or self.value == self.rem.value \
                or self.value == self.mod.value \
                or self.value == self.equal.value \
                or self.value == self.notequal.value \
                or self.value == self.lessthan.value \
                or self.value == self.lessthanequal.value \
                or self.value == self.greaterthan.value \
                or self.value == self.greaterthanequal.value:
            if len(Inputs) != 2:
                return False
            if Inputs[0].getType() != Inputs[1].getType():
                return False
            if not isinstance(Inputs[0].getType(), RoseIntegerType) \
                    and not Inputs[0].getType().isFloatTy():
                return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.abs.value:
            if len(Inputs) != 1:
                return False
            if not isinstance(Inputs[0].getType(), RoseIntegerType):
                return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.not_.value:
            if len(Inputs) != 1:
                return False
            if not isinstance(Inputs[0].getType(), RoseBooleanType) \
                    and not isinstance(Inputs[0].getType(), RoseIntegerType):
                return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.and_.value \
                or self.value == self.nand.value \
                or self.value == self.or_.value \
                or self.value == self.nor.value:
            if not (len(Inputs) > 1):
                return False
            for Input in Inputs:
                if not isinstance(Input.getType(), RoseBooleanType) \
                        and not isinstance(Input.getType(), RoseIntegerType):
                    return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.xor.value:
            if len(Inputs) != 2:
                return False
            if not isinstance(Inputs[0].getType(), RoseBooleanType) \
                    and not isinstance(Inputs[0].getType(), RoseIntegerType):
                return False
            if not isinstance(Inputs[1].getType(), RoseBooleanType) \
                    and not isinstance(Inputs[1].getType(), RoseIntegerType):
                return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.bvabs.value:
            if len(Inputs) != 1:
                return False
            if not isinstance(Inputs[0].getType(), RoseBitVectorType):
                return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.bvpopcnt.value:
            if len(Inputs) != 1:
                return False
            if not isinstance(Inputs[0].getType(), RoseBitVectorType):
                return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.select.value:
            if len(Inputs) != 3:
                return False
            Cond = Inputs[0]
            Then = Inputs[1]
            Else = Inputs[2]
            if Then.getType() != Else.getType():
                return False
            if isinstance(Then.getType(), RoseVoidType) \
                    or isinstance(Then.getType(), RoseUndefinedType):
                return False
            if not isinstance(Cond.getType(), RoseBitVectorType) \
                    and not isinstance(Cond.getType(), RoseBooleanType):
                return False
            if isinstance(Cond.getType(), RoseBitVectorType):
                if Cond.getType().getBitwidth() != 1:
                    return False
            if self.getOutputType(Inputs) != OutputType:
                return False
            return True
        if self.value == self.mtxinsertel.value:
            # `mtxinsertel <elements> <tile> <r1> <c1> <r2> <c2>`
            Valid = True
            element, tile, r1, c1, r2, c2 = Inputs
            idxs = [r1, c1, r2, c2]
            tile_t = tile.getType()
            Valid &= isinstance(element.getType(), RoseBitVectorType)
            Valid &= isinstance(tile_t, RoseMatrixType)
            Valid &= all(isinstance(idx.getType(), RoseIntegerType) for idx in idxs)
            Valid &= element.getType() == RoseBitVectorType.create(tile_t.getElementBitwidth())
            if all(isinstance(idx, RoseValues.RoseConstant) for idx in idxs):
                Valid &= r1.getValue() <= r2.getValue()
                Valid &= c1.getValue() <= c2.getValue()
                Valid &= all(0 <= r < tile_t.getMaxRows() for r in [r1, r2])
                Valid &= all(0 <= c < tile_t.getMaxCols() for c in [c1, c2])
            return Valid
        if self.value == self.mtxinsertrow.value:
            # `mtxinsertrow <elements> <tile> <idx>`
            Valid = True
            elements, tile, idx = Inputs
            tile_t = tile.getType()
            Valid &= isinstance(elements.getType(), RoseBitVectorType)
            Valid &= isinstance(tile_t, RoseMatrixType)
            Valid &= isinstance(idx.getType(), RoseIntegerType)
            Valid &= elements.getType() == RoseBitVectorType.create(
                tile_t.getElementBitwidth() * tile_t.getMaxCols()
            )
            if isinstance(idx, RoseValues.RoseConstant):
                Valid &= 0 <= idx.getValue()
                Valid &= idx.getValue() < tile_t.getMaxRows()
            return Valid
        if self.value == self.mtxextractrow.value:
            # `mtxextractrow <tile> <idx>`
            Valid = True
            tile, idx = Inputs
            tile_t = tile.getType()
            Valid &= isinstance(tile_t, RoseMatrixType)
            if isinstance(idx, RoseValues.RoseConstant):
                Valid &= 0 <= idx.getValue()
                Valid &= idx.getValue() < tile_t.getMaxRows()
            return RoseBitVectorType.create(
                tile_t.getElementBitwidth() * tile_t.getMaxCols())
        return None

    def typesOfInputsAndOutputEqual(self):
        if self.value == self.bvadd.value \
                or self.value == self.bvsub.value \
                or self.value == self.bvmul.value \
                or self.value == self.bvor.value \
                or self.value == self.bvxor.value \
                or self.value == self.bvand.value \
                or self.value == self.bvshl.value \
                or self.value == self.bvlshr.value \
                or self.value == self.bvashr.value \
                or self.value == self.bvsmin.value \
                or self.value == self.bvumin.value \
                or self.value == self.bvsmax.value \
                or self.value == self.bvumax.value \
                or self.value == self.bvnot.value \
                or self.value == self.bvneg.value \
                or self.value == self.bvadd1.value \
                or self.value == self.bvsub1.value \
                or self.value == self.bvsdiv.value \
                or self.value == self.bvudiv.value \
                or self.value == self.bvsrem.value \
                or self.value == self.bvurem.value \
                or self.value == self.bvsmod.value \
                or self.value == self.bvrol.value \
                or self.value == self.bvror.value \
                or self.value == self.not_.value \
                or self.value == self.and_.value \
                or self.value == self.nand.value \
                or self.value == self.or_.value \
                or self.value == self.nor.value \
                or self.value == self.xor.value \
                or self.value == self.add.value \
                or self.value == self.sub.value \
                or self.value == self.mul.value \
                or self.value == self.min.value \
                or self.value == self.max.value \
                or self.value == self.div.value \
                or self.value == self.rem.value \
                or self.value == self.mod.value \
                or self.value == self.abs.value \
                or self.value == self.bvpopcnt.value \
                or self.value == self.bvabs.value:
            return True
        if self.value == self.bvzero.value \
                or self.value == self.lsb.value \
                or self.value == self.msb.value \
                or self.value == self.bit.value \
                or self.value == self.bveq.value \
                or self.value == self.bvneq.value \
                or self.value == self.bvslt.value \
                or self.value == self.bvult.value \
                or self.value == self.bvsle.value \
                or self.value == self.bvule.value \
                or self.value == self.bvsgt.value \
                or self.value == self.bvugt.value \
                or self.value == self.bvsge.value \
                or self.value == self.bvuge.value \
                or self.value == self.bvextract.value \
                or self.value == self.bvinsert.value \
                or self.value == self.call.value \
                or self.value == self.opaquecall.value \
                or self.value == self.bvpadhighbits.value \
                or self.value == self.select.value \
                or self.value == self.rotateleft.value \
                or self.value == self.rotateright.value \
                or self.value == self.equal.value \
                or self.value == self.notequal.value \
                or self.value == self.lessthan.value \
                or self.value == self.lessthanequal.value \
                or self.value == self.greaterthan.value \
                or self.value == self.greaterthanequal.value\
                or self.value == self.cast.value \
                or self.value == self.bvssat.value \
                or self.value == self.bvusat.value \
                or self.value == self.bvsaturate.value \
                or self.value == self.bvtrunclow.value \
                or self.value == self.bvtrunchigh.value \
                or self.value == self.bvsignextend.value \
                or self.value == self.bvzeroextend.value \
                or self.value == self.bvsizeextend.value \
                or self.value == self.bvgeneraladd.value \
                or self.value == self.bvgeneralsub.value \
                or self.value == self.bvgeneraldiv.value \
                or self.value == self.bvgeneralrem.value \
                or self.value == self.bvgeneralmax.value \
                or self.value == self.bvgeneralmin.value \
                or self.value == self.bvgenerallt.value \
                or self.value == self.bvgeneralle.value \
                or self.value == self.bvgeneralgt.value \
                or self.value == self.bvgeneralge.value \
                or self.value == self.ret.value \
                or self.value == self.mtxextractrow.value \
                or self.value == self.mtxinsertrow.value \
                or self.value == self.mtxinsertel.value:
            return False
        return None

    def typesOfOperandsAreEqual(self):
        if self.value == self.bvadd.value \
                or self.value == self.bvsub.value \
                or self.value == self.bvmul.value \
                or self.value == self.bvor.value \
                or self.value == self.bvxor.value \
                or self.value == self.bvand.value \
                or self.value == self.bvshl.value \
                or self.value == self.bvlshr.value \
                or self.value == self.bvashr.value \
                or self.value == self.bvsmin.value \
                or self.value == self.bvumin.value \
                or self.value == self.bvsmax.value \
                or self.value == self.bvumax.value \
                or self.value == self.bvsdiv.value \
                or self.value == self.bvudiv.value \
                or self.value == self.bvsrem.value \
                or self.value == self.bvurem.value \
                or self.value == self.bvsmod.value \
                or self.value == self.bvrol.value \
                or self.value == self.bvror.value \
                or self.value == self.bveq.value \
                or self.value == self.bvneq.value \
                or self.value == self.bvslt.value \
                or self.value == self.bvult.value \
                or self.value == self.bvsle.value \
                or self.value == self.bvule.value \
                or self.value == self.bvsgt.value \
                or self.value == self.bvugt.value \
                or self.value == self.bvsge.value \
                or self.value == self.bvuge.value \
                or self.value == self.bit.value \
                or self.value == self.and_.value \
                or self.value == self.nand.value \
                or self.value == self.or_.value \
                or self.value == self.nor.value \
                or self.value == self.xor.value \
                or self.value == self.add.value \
                or self.value == self.sub.value \
                or self.value == self.mul.value \
                or self.value == self.min.value \
                or self.value == self.max.value \
                or self.value == self.div.value \
                or self.value == self.rem.value \
                or self.value == self.mod.value \
                or self.value == self.equal.value \
                or self.value == self.notequal.value \
                or self.value == self.lessthan.value \
                or self.value == self.lessthanequal.value \
                or self.value == self.greaterthan.value \
                or self.value == self.greaterthanequal.value:
            return True
        if self.value == self.bvextract.value \
                or self.value == self.bvinsert.value \
                or self.value == self.bvsignextend.value \
                or self.value == self.bvzeroextend.value \
                or self.value == self.bvsizeextend.value \
                or self.value == self.bvgeneraladd.value \
                or self.value == self.bvgeneralsub.value \
                or self.value == self.bvgeneraldiv.value \
                or self.value == self.bvgeneralrem.value \
                or self.value == self.bvgeneralmax.value \
                or self.value == self.bvgeneralmin.value \
                or self.value == self.bvgenerallt.value \
                or self.value == self.bvgeneralle.value \
                or self.value == self.bvgeneralgt.value \
                or self.value == self.bvgeneralge.value \
                or self.value == self.bvssat.value \
                or self.value == self.bvusat.value \
                or self.value == self.bvsaturate.value \
                or self.value == self.bvtrunclow.value \
                or self.value == self.bvtrunchigh.value \
                or self.value == self.call.value \
                or self.value == self.opaquecall.value \
                or self.value == self.bvpadhighbits.value \
                or self.value == self.select.value \
                or self.value == self.bvnot.value \
                or self.value == self.bvneg.value \
                or self.value == self.ret.value \
                or self.value == self.abs.value \
                or self.value == self.bvabs.value \
                or self.value == self.bvpopcnt.value \
                or self.value == self.lsb.value \
                or self.value == self.msb.value \
                or self.value == self.bvzero.value \
                or self.value == self.bvadd1.value \
                or self.value == self.bvsub1.value \
                or self.value == self.not_.value \
                or self.value == self.cast.value \
                or self.value == self.rotateleft.value \
                or self.value == self.rotateright.value \
                or self.value == self.mtxextractrow.value \
                or self.value == self.mtxinsertrow.value \
                or self.value == self.mtxinsertel.value:
            return False
        return None

    def isValidNumInputs(self, NumInputs: int):
        if self.value == self.bvzero.value \
                or self.value == self.lsb.value \
                or self.value == self.msb.value \
                or self.value == self.bvneg.value \
                or self.value == self.bvnot.value \
                or self.value == self.bvadd1.value \
                or self.value == self.bvsub1.value:
            return (NumInputs == 1)
        if self.value == self.bvadd.value \
                or self.value == self.bvsub.value \
                or self.value == self.bvmul.value \
                or self.value == self.bvor.value \
                or self.value == self.bvxor.value \
                or self.value == self.bvand.value \
                or self.value == self.bvshl.value \
                or self.value == self.bvlshr.value \
                or self.value == self.bvashr.value \
                or self.value == self.bvsmin.value \
                or self.value == self.bvumin.value \
                or self.value == self.bvsmax.value \
                or self.value == self.bvumax.value:
            return (NumInputs > 1)
        if self.value == self.bvsdiv.value \
                or self.value == self.bvudiv.value \
                or self.value == self.bvsrem.value \
                or self.value == self.bvurem.value \
                or self.value == self.bvsmod.value \
                or self.value == self.bvrol.value \
                or self.value == self.bvror.value \
                or self.value == self.bit.value \
                or self.value == self.bveq.value \
                or self.value == self.bvneq.value \
                or self.value == self.bvslt.value \
                or self.value == self.bvult.value \
                or self.value == self.bvsle.value \
                or self.value == self.bvule.value \
                or self.value == self.bvsgt.value \
                or self.value == self.bvugt.value \
                or self.value == self.bvsge.value \
                or self.value == self.bvuge.value \
                or self.value == self.rotateleft.value \
                or self.value == self.rotateright.value:
            return (NumInputs == 2)
        if self.value == self.bvextract.value:
            return (NumInputs == 4)
        if self.value == self.bvinsert.value:
            return (NumInputs == 5)
        if self.value == self.bvsignextend.value \
                or self.value == self.bvzeroextend.value \
                or self.value == self.bvssat.value \
                or self.value == self.bvusat.value \
                or self.value == self.bvtrunclow.value \
                or self.value == self.bvtrunchigh.value:
            return (NumInputs == 2)
        if self.value == self.select.value \
                or self.value == self.bvsizeextend.value \
                or self.value == self.bvsaturate.value \
                or self.value == self.bvgeneraldiv.value \
                or self.value == self.bvgeneralrem.value \
                or self.value == self.bvgenerallt.value \
                or self.value == self.bvgeneralle.value \
                or self.value == self.bvgeneralgt.value \
                or self.value == self.bvgeneralge.value:
            return (NumInputs == 3)
        if self.value == self.call.value \
                or self.value == self.opaquecall.value:
            return (NumInputs >= 0)
        if self.value == self.bvpadhighbits.value:
            return (NumInputs == 2)
        if self.value == self.ret.value \
                or self.value == self.abs.value:
            return (NumInputs == 1)
        if self.value == self.add.value \
                or self.value == self.sub.value \
                or self.value == self.mul.value \
                or self.value == self.min.value \
                or self.value == self.max.value:
            return (NumInputs > 1)
        if self.value == self.div.value \
                or self.value == self.rem.value \
                or self.value == self.mod.value \
                or self.value == self.equal.value \
                or self.value == self.notequal.value \
                or self.value == self.lessthan.value \
                or self.value == self.lessthanequal.value \
                or self.value == self.greaterthan.value \
                or self.value == self.greaterthanequal.value:
            return (NumInputs == 2)
        if self.value == self.not_.value:
            return (NumInputs == 1)
        if self.value == self.and_.value \
                or self.value == self.nand.value \
                or self.value == self.or_.value \
                or self.value == self.nor.value:
            return (NumInputs > 1)
        if self.value == self.xor.value:
            return (NumInputs == 2)
        if self.value == self.cast.value:
            return (NumInputs == 1)
        if self.value == self.bvabs.value:
            return (NumInputs == 1)
        if self.value == self.bvpopcnt.value:
            return (NumInputs == 1)
        if self.value == self.bvgeneraladd.value \
                or self.value == self.bvgeneralsub.value \
                or self.value == self.bvgeneralmax.value \
                or self.value == self.bvgeneralmin.value:
            return (NumInputs >= 3)
        if self.value == self.mtxinsertel.value: 
            return NumInputs == 6 
        if self.value == self.mtxinsertrow.value: 
            return NumInputs == 3 
        if self.value == self.mtxextractrow.value: 
            return NumInputs == 2 
        return None

    def isBitVectorOpcode(self):
        if self.value == self.bvzero.value \
                or self.value == self.lsb.value \
                or self.value == self.msb.value \
                or self.value == self.bvneg.value \
                or self.value == self.bvnot.value \
                or self.value == self.bvadd1.value \
                or self.value == self.bvsub1.value \
                or self.value == self.bvadd.value \
                or self.value == self.bvsub.value \
                or self.value == self.bvmul.value \
                or self.value == self.bvgeneraladd.value \
                or self.value == self.bvgeneralsub.value \
                or self.value == self.bvor.value \
                or self.value == self.bvxor.value \
                or self.value == self.bvand.value \
                or self.value == self.bvshl.value \
                or self.value == self.bvlshr.value \
                or self.value == self.bvashr.value \
                or self.value == self.bvsmin.value \
                or self.value == self.bvumin.value \
                or self.value == self.bvsmax.value \
                or self.value == self.bvumax.value \
                or self.value == self.bvgeneralmax.value \
                or self.value == self.bvgeneralmin.value \
                or self.value == self.bvsdiv.value \
                or self.value == self.bvudiv.value \
                or self.value == self.bvsrem.value \
                or self.value == self.bvurem.value \
                or self.value == self.bvgeneraldiv.value \
                or self.value == self.bvgeneralrem.value \
                or self.value == self.bvgenerallt.value \
                or self.value == self.bvgeneralle.value \
                or self.value == self.bvgeneralgt.value \
                or self.value == self.bvgeneralge.value \
                or self.value == self.bvsmod.value \
                or self.value == self.bvrol.value \
                or self.value == self.bvror.value \
                or self.value == self.bit.value \
                or self.value == self.bveq.value \
                or self.value == self.bvneq.value \
                or self.value == self.bvslt.value \
                or self.value == self.bvult.value \
                or self.value == self.bvsle.value \
                or self.value == self.bvule.value \
                or self.value == self.bvsgt.value \
                or self.value == self.bvugt.value \
                or self.value == self.bvsge.value \
                or self.value == self.bvuge.value \
                or self.value == self.bvabs.value \
                or self.value == self.bvpopcnt.value \
                or self.value == self.rotateleft.value \
                or self.value == self.rotateright.value \
                or self.value == self.bvextract.value \
                or self.value == self.bvinsert.value \
                or self.value == self.bvsignextend.value \
                or self.value == self.bvzeroextend.value \
                or self.value == self.bvsizeextend.value \
                or self.value == self.bvssat.value \
                or self.value == self.bvusat.value \
                or self.value == self.bvsaturate.value \
                or self.value == self.bvtrunclow.value \
                or self.value == self.bvtrunchigh.value \
                or self.value == self.bvconcat.value \
                or self.value == self.bvpadhighbits.value \
                or self.value == self.mtxextractrow.value \
                or self.value == self.mtxinsertrow.value \
                or self.value == self.mtxinsertel.value:
            return True
        return False

    def isSizeChangingOp(self):
        if self.value == self.bvsignextend.value \
                or self.value == self.bvzeroextend.value \
                or self.value == self.bvsizeextend.value \
                or self.value == self.bvssat.value \
                or self.value == self.bvusat.value \
                or self.value == self.bvsaturate.value \
                or self.value == self.bvtrunclow.value \
                or self.value == self.bvtrunchigh.value:
            return True
        return False

    def getRosetteOp(self):
        # Some opcodes have the same name as Rosette ops
        if self.value == self.bvadd.value \
                or self.value == self.bvsub.value \
                or self.value == self.bvmul.value \
                or self.value == self.bvor.value \
                or self.value == self.bvxor.value \
                or self.value == self.bvand.value \
                or self.value == self.bvshl.value \
                or self.value == self.bvlshr.value \
                or self.value == self.bvashr.value \
                or self.value == self.bvsmin.value \
                or self.value == self.bvumin.value \
                or self.value == self.bvsmax.value \
                or self.value == self.bvumax.value \
                or self.value == self.bvnot.value \
                or self.value == self.bvneg.value \
                or self.value == self.bvadd1.value \
                or self.value == self.bvsub1.value \
                or self.value == self.bvsdiv.value \
                or self.value == self.bvudiv.value \
                or self.value == self.bvsrem.value \
                or self.value == self.bvurem.value \
                or self.value == self.bvsmod.value \
                or self.value == self.bvrol.value \
                or self.value == self.bvror.value \
                or self.value == self.lsb.value \
                or self.value == self.msb.value \
                or self.value == self.bit.value \
                or self.value == self.bveq.value \
                or self.value == self.bvslt.value \
                or self.value == self.bvult.value \
                or self.value == self.bvsle.value \
                or self.value == self.bvule.value \
                or self.value == self.bvsgt.value \
                or self.value == self.bvugt.value \
                or self.value == self.bvsge.value \
                or self.value == self.bvuge.value \
                or self.value == self.abs.value \
                or self.value == self.min.value \
                or self.value == self.max.value:
            return self.name
        # Hand code some of the names of rosette ops
        if self.value == self.bvzero.value:
            return "bvzero?"
        if self.value == self.not_.value:
            return "not"
        if self.value == self.and_.value:
            return "and"
        if self.value == self.nand.value:
            return "nand"
        if self.value == self.or_.value:
            return "or"
        if self.value == self.nor.value:
            return "nor"
        if self.value == self.xor.value:
            return "xor"
        if self.value == self.add.value:
            return "+"
        if self.value == self.sub.value:
            return "-"
        if self.value == self.mul.value:
            return "*"
        if self.value == self.div.value:
            return "/"
        if self.value == self.rem.value:
            return "remainder"
        if self.value == self.mod.value:
            return "modulo"
        if self.value == self.bvextract.value:
            return "extract"
        if self.value == self.rotateleft.value:
            return "rotate-left"
        if self.value == self.rotateright.value:
            return "rotate-right"
        if self.value == self.bvsignextend.value:
            return "sign-extend"
        if self.value == self.bvzeroextend.value:
            return "zero-extend"
        if self.value == self.equal.value:
            return "equal?"
        if self.value == self.lessthan.value:
            return "<"
        if self.value == self.lessthanequal.value:
            return "<="
        if self.value == self.greaterthan.value:
            return ">"
        if self.value == self.greaterthanequal.value:
            return ">="
        # These ops exist in Rose IR but not in Rosette
        if self.value == self.bvssat.value \
                or self.value == self.bvusat.value \
                or self.value == self.bvsaturate.value \
                or self.value == self.bvsizeextend.value \
                or self.value == self.bvgeneraladd.value \
                or self.value == self.bvgeneralsub.value \
                or self.value == self.bvgeneraldiv.value \
                or self.value == self.bvgeneralrem.value \
                or self.value == self.bvgeneralmax.value \
                or self.value == self.bvgeneralmin.value \
                or self.value == self.bvgenerallt.value \
                or self.value == self.bvgeneralle.value \
                or self.value == self.bvgeneralgt.value \
                or self.value == self.bvgeneralge.value \
                or self.value == self.bvtrunclow.value \
                or self.value == self.bvtrunchigh.value \
                or self.value == self.bvinsert.value \
                or self.value == self.call.value \
                or self.value == self.opaquecall.value \
                or self.value == self.bvpadhighbits.value \
                or self.value == self.select.value \
                or self.value == self.ret.value \
                or self.value == self.cast.value \
                or self.value == self.bvneq.value \
                or self.value == self.notequal.value \
                or self.value == self.bvpopcnt.value \
                or self.value == self.bvabs.value:
            assert False, "No direct conversion to Rosette Ops"
        return None


# Let's see how this could be useful
class HighOrderFunctions(Enum):
    apply = auto()
    map = auto()
    zip = auto()

    def __str__(self):
        return self.name
