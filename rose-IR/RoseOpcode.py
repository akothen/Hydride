from enum import Enum, auto
from RoseType import RoseType
from  RoseValue import RoseValue
from RoseConstants import RoseConstant
import RoseAbstractions

# List of all operations that
# involve bitvectors.
class RoseOpcode(Enum):
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
    concat = auto()
    bvextract = auto()
    bvinsert = auto()
    bvsignextend = auto()
    bvzeroextend = auto()
    call = auto()
    select = auto()
    ret = auto()  # "return" is a keyword in Python

    def __str__(self):
        return self.name
    
    def __eq__(self, Other):
        print(Other)
        assert isinstance(Other, RoseOpcode)
        return self.value == Other.value

    def __ne__(self, Other):
        print(Other)
        assert isinstance(Other, RoseOpcode)
        return self.value != Other.value
    
    def getBVOpInputs(self, Inputs : list):
        BVInputs = []
        for Input in Inputs:
            assert isinstance(Input, RoseValue)
            if Input.getType().isBitVectorTy():
                BVInputs.append(Input)
        return BVInputs

    def getOutputType(self, Inputs : list): 
        assert(len(Inputs) >= 1)
        if self.value == self.bvzero.value \
        or self.value == self.bit.value \
        or self.value == self.lsb.value \
        or self.value == self.msb.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert(len(BVInputs) == 1)
            return RoseType.getBitVectorTy(1)
        if self.value == self.bvneg.value \
        or self.value == self.bvnot.value \
        or self.value == self.bvadd1.value \
        or self.value == self.bvsub1.value \
        or self.value == self.rotateleft.value \
        or self.value == self.rotateright.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert(len(BVInputs) == 1)
            return RoseType.getBitVectorTy(BVInputs[0].getType().getBitwidth())
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
            BVInputs = self.getBVOpInputs(Inputs)
            assert(len(BVInputs) > 1)
            return RoseType.getBitVectorTy(BVInputs[0].getType().getBitwidth())
        if self.value == self.bvsdiv.value \
        or self.value == self.bvudiv.value \
        or self.value == self.bvsrem.value \
        or self.value == self.bvurem.value \
        or self.value == self.bvsmod.value \
        or self.value == self.bvrol.value \
        or self.value == self.bvror.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert(len(BVInputs) == 2)
            return RoseType.getBitVectorTy(BVInputs[0].getType().getBitwidth())
        if self.value == self.bveq.value \
        or self.value == self.bvslt.value \
        or self.value == self.bvult.value \
        or self.value == self.bvsle.value \
        or self.value == self.bvule.value \
        or self.value == self.bvsgt.value \
        or self.value == self.bvugt.value \
        or self.value == self.bvsge.value \
        or self.value == self.bvuge.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert(len(BVInputs) == 2)
            return RoseType.getBitVectorTy(1)
        if self.value == self.bvinsert.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert(len(BVInputs) == 2)
            return RoseType.getVoidTy()
        if self.value == self.call.value:
            Callee = Inputs[0]
            assert isinstance(Callee, RoseAbstractions.RoseFunction)
            return Callee.getType().getReturnType()
        if self.value == self.select.value:
            assert Inputs[1].getType() == Inputs[2].getType()
            return Inputs[1].getType()
        if self.value == self.ret.value:
            return Inputs[0].getType()
        if self.value == self.bvextract.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert(len(BVInputs) == 1)
            assert Inputs[1].getType() == Inputs[2].getType()
            # TODO: This is temporary. This needs to be fixed.
            assert isinstance(Inputs[1], RoseConstant)
            assert isinstance(Inputs[2], RoseConstant)
            Bitwidth = (Inputs[2].getValue() - Inputs[1].getValue() + 1)
            return RoseType.getBitVectorTy(Bitwidth)
        return None

    def inputsAreValid(self, Inputs : list): 
        if self.isValidNumInputs(len(Inputs)) == False:
            return False
        if self.value == self.bvzero.value \
        or self.value == self.bit.value \
        or self.value == self.lsb.value \
        or self.value == self.msb.value \
        or self.value == self.bvneg.value \
        or self.value == self.bvnot.value \
        or self.value == self.bvadd1.value \
        or self.value == self.bvsub1.value \
        or self.value == self.rotateleft.value \
        or self.value == self.rotateright.value \
        or self.value == self.bvextract.value:
            BVInputs = self.getBVOpInputs(Inputs)
            print("BVInputs:")
            print(BVInputs)
            if len(BVInputs) == 1:
                return True
            else:
                return False
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
            BVInputs = self.getBVOpInputs(Inputs)
            if len(BVInputs) > 1:
                return True
            else:
                return False
        if self.value == self.bvsdiv.value \
        or self.value == self.bvudiv.value \
        or self.value == self.bvsrem.value \
        or self.value == self.bvurem.value \
        or self.value == self.bvsmod.value \
        or self.value == self.bvrol.value \
        or self.value == self.bvror.value \
        or self.value == self.bveq.value \
        or self.value == self.bvslt.value \
        or self.value == self.bvult.value \
        or self.value == self.bvsle.value \
        or self.value == self.bvule.value \
        or self.value == self.bvsgt.value \
        or self.value == self.bvugt.value \
        or self.value == self.bvsge.value \
        or self.value == self.bvuge.value \
        or self.value == self.bvinsert.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if len(BVInputs) == 2:
                return True
            else:
                return False
        if self.value == self.call.value:
            Callee = Inputs[0]
            if len(Inputs) > 1:
                return self.callInputsAreValid(Callee, Inputs[1:])
            return self.callInputsAreValid(Callee, [])
        if self.value == self.select.value:
            return self.selectInputsAreValid(Inputs)
        if self.value == self.ret.value:
            assert isinstance(Inputs[0], RoseValue)
            return (len(Inputs) == 1)
        return None
    
    def isValidNumInputs(self, NumInputs : int):
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
            return (NumInputs == 3)
        if self.value == self.bvinsert.value:
            return (NumInputs == 4)
        if self.value == self.select.value:
            return (NumInputs == 3)
        if self.value == self.call.value:
            return (NumInputs >= 1)
        if self.value == self.ret.value:
            return (NumInputs == 1)
        return None

    def callInputsAreValid(self, Callee, Inputs : list):
        assert self.value == self.call.value
        print("callInputsAreValid")
        if not isinstance(Callee, RoseAbstractions.RoseFunction):
            return False
        print("OPCODE IS VALID")
        if len(Inputs) != Callee.getNumArgs():
            print("INPUT LENGHTS ARE NOT EQUAL")
            return False
        print("INPUT LENGHTS ARE EQUAL")
        for Index in range(Callee.getNumArgs()):
            Arg = Callee.getArg(Index)
            print(Arg.getType())
            print(Inputs[Index].getType())
            Arg.getType().print()
            Inputs[Index].getType().print()
            if Arg.getType() != Inputs[Index].getType():
                print(Index)
                return False
        return True
    
    def selectInputsAreValid(self, Inputs : list):
        assert self.value == self.selec.value
        if len(Inputs) != 3:
            return False
        Cond = Inputs[0]
        Then = Inputs[1]
        Else = Inputs[2]
        if Then.getType() != Else.getType():
            return False
        if Then.getType() == RoseType.isVoidTy() or Then.getType() == RoseType.isUndefTy():
            return False
        if not Cond.getType().isBitVectorTy() and not Cond.getType().isIntegerTy():
            return False
        if Cond.getType().getBitwidth() != 1:
            return False
        return True


# Let's see how this could be useful
class HighOrderFunctions(Enum):
    apply = auto()
    map = auto()
    zip = auto()

    def __str__(self):
        return self.name
