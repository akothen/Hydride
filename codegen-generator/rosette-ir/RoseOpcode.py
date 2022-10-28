##############################################################
#
# This file contains all the opcodes of all operations 
# supported in the  Rosette IR.
#
##############################################################


from RoseTypes import *
from  RoseValue import RoseValue
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

    # Boolean ops
    boolnot = auto()
    booland = auto()
    boolnand = auto()
    boolor = auto()
    boolnor = auto()
    boolxor = auto()

    # This op has no direct convertion to Rosette
    # but important for SSA representation in IR.
    bvinsert = auto()

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

    # Racket/Rosette doesn't have these ops
    # but its convenient to have them here.
    bvneq = auto()
    notequal = auto()

    # Ops to represent truncation
    bvtrunclow = auto()
    bvtrunchigh = auto()

    # Add an op for absolute value for bitvectors
    bvabs = auto()

    # Op useful for code generation. The callee for this
    # does not have to be defined.
    opaquecall = auto()

    # Op to represent padding of high bits with
    # zeros. This is important for semantics represented
    # using Rose IR.
    bvpadhighbits = auto()


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

    def getBVOpInputs(self, Inputs : list):
        BVInputs = []
        for Input in Inputs:
            assert isinstance(Input, RoseValue)
            if isinstance(Input.getType(), RoseBitVectorType):
                BVInputs.append(Input)
        return BVInputs

    def getOutputType(self, Inputs : list): 
        assert(len(Inputs) >= 1)
        if self.value == self.bit.value \
        or self.value == self.lsb.value \
        or self.value == self.msb.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert(len(BVInputs) == 1)
            return RoseBitVectorType.create(1)
        if self.value == self.bvzero.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert(len(BVInputs) == 1)
            return RoseBooleanType.create()
        if self.value == self.bvneg.value \
        or self.value == self.bvnot.value \
        or self.value == self.bvadd1.value \
        or self.value == self.bvsub1.value \
        or self.value == self.rotateleft.value \
        or self.value == self.rotateright.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert(len(BVInputs) == 1)
            return RoseBitVectorType.create(BVInputs[0].getType().getBitwidth())
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
            return RoseBitVectorType.create(BVInputs[0].getType().getBitwidth())
        if self.value == self.bvsdiv.value \
        or self.value == self.bvudiv.value \
        or self.value == self.bvsrem.value \
        or self.value == self.bvurem.value \
        or self.value == self.bvsmod.value \
        or self.value == self.bvrol.value \
        or self.value == self.bvror.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert(len(BVInputs) == 2)
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
        or self.value == self.bvuge.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert(len(BVInputs) == 2)
            return RoseBooleanType.create()
        if self.value == self.bvinsert.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert(len(BVInputs) == 2)
            # The bitwidth inserted by is a constant value
            assert isinstance(Inputs[4], RoseValues.RoseConstant)
            return RoseVoidType.create()
        if self.value == self.call.value:
            Callee = Inputs[0]
            assert isinstance(Callee, RoseAbstractions.RoseFunction)
            return Callee.getType().getReturnType()
        if self.value == self.opaquecall.value:
            Callee = Inputs[1]
            assert isinstance(Callee, RoseValues.RoseConstant)
            assert isinstance(Inputs[0], RoseType)
            return Inputs[0]
        if self.value == self.bvpadhighbits.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert(len(BVInputs) == 1)
            # The number of high bits that should be 
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
            assert(len(BVInputs) == 1)
            assert Inputs[1].getType() == Inputs[2].getType()
            # TODO: This is temporary. This needs to be fixed.
            #assert isinstance(Inputs[1], RoseConstant)
            #assert isinstance(Inputs[2], RoseConstant)
            #Bitwidth = (Inputs[2].getValue() - Inputs[1].getValue() + 1)
            assert isinstance(Inputs[3], RoseValues.RoseConstant)
            return RoseBitVectorType.create(Inputs[3].getValue())
        if self.value == self.bvsignextend.value \
        or self.value == self.bvzeroextend.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert(len(BVInputs) == 1)
            assert isinstance(Inputs[1], RoseValues.RoseConstant)
            assert Inputs[1].getValue() > BVInputs[0].getType().getBitwidth()
            return RoseBitVectorType.create(Inputs[1].getValue())
        if self.value == self.bvsizeextend.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert(len(BVInputs) == 1)
            assert isinstance(Inputs[1], RoseValues.RoseConstant)
            assert isinstance(Inputs[2], RoseValues.RoseConstant)
            assert Inputs[1].getValue() > BVInputs[0].getType().getBitwidth()
            return RoseBitVectorType.create(Inputs[1].getValue())
        if self.value == self.bvssat.value \
        or self.value == self.bvusat.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert(len(BVInputs) == 1)
            assert isinstance(Inputs[1], RoseValues.RoseConstant)
            assert Inputs[1].getValue() <= BVInputs[0].getType().getBitwidth()
            return RoseBitVectorType.create(Inputs[1].getValue())
        if self.value == self.bvtrunclow.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert(len(BVInputs) == 1)
            assert isinstance(Inputs[1], RoseValues.RoseConstant)
            assert Inputs[1].getValue() < BVInputs[0].getType().getBitwidth()
            return RoseBitVectorType.create(Inputs[1].getValue()) 
        if self.value == self.bvtrunchigh.value:
            BVInputs = self.getBVOpInputs(Inputs)
            assert(len(BVInputs) == 1)
            assert isinstance(Inputs[1], RoseValues.RoseConstant)
            assert Inputs[1].getValue() < BVInputs[0].getType().getBitwidth()
            return RoseBitVectorType.create(Inputs[1].getValue())
        if self.value == self.add.value \
        or self.value == self.sub.value \
        or self.value == self.mul.value \
        or self.value == self.min.value \
        or self.value == self.max.value:
            assert(len(Inputs) > 1)
            if isinstance(Inputs[0].getType(), RoseIntegerType):
                return RoseIntegerType.create(Inputs[0].getType().getBitwidth())
            assert Inputs[0].getType().isFloatTy()
            return RoseFloatType.create(Inputs[0].getType().getBitwidth())
        if self.value == self.div.value \
        or self.value == self.rem.value \
        or self.value == self.mod.value:
            assert(len(Inputs) == 2)
            if isinstance(Inputs[0].getType(), RoseIntegerType) \
            and isinstance(Inputs[1].getType(), RoseIntegerType):
                return RoseIntegerType.create(Inputs[0].getType().getBitwidth())
            assert Inputs[0].getType().isFloatTy() or Inputs[1].getType().isFloatTy()
            return RoseFloatType.create(Inputs[0].getType().getBitwidth())
        if self.value == self.abs.value:
            assert(len(Inputs) == 1)
            assert isinstance(Inputs[0].getType(), RoseIntegerType)
            return RoseIntegerType.create(Inputs[0].getType().getBitwidth())
        if self.value == self.equal.value \
        or self.value == self.notequal.value \
        or self.value == self.lessthan.value \
        or self.value == self.lessthanequal.value \
        or self.value == self.greaterthan.value \
        or self.value == self.greaterthanequal.value:
            assert(len(Inputs) == 2)
            return RoseBooleanType.create()
        if self.value == self.boolnot.value:
            assert(len(Inputs) == 1)
            return RoseBooleanType.create()
        if self.value == self.booland.value \
        or self.value == self.boolnand.value \
        or self.value == self.boolor.value \
        or self.value == self.boolnor.value:
             assert(len(Inputs) > 1)
             return RoseBooleanType.create()
        if self.value == self.boolxor.value:
            assert(len(Inputs) == 2)
            return RoseBooleanType.create()
        if self.value == self.cast.value:
            assert(len(Inputs) == 2)
            assert isinstance(Inputs[0], RoseValue)
            assert isinstance(Inputs[1], RoseType)
            assert Inputs[0].getType() != Inputs[1]
            return Inputs[1]
        if self.value == self.bvabs.value:
            assert(len(Inputs) == 1)
            assert isinstance(Inputs[0].getType(), RoseBitVectorType)
            return RoseBitVectorType.create(Inputs[0].getType().getBitwidth())
        return None

    def inputsAreValid(self, Inputs : list): 
        if self.isValidNumInputs(len(Inputs)) == False:
            print("false")
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
        or self.value == self.rotateright.value:
            BVInputs = self.getBVOpInputs(Inputs)
            print("BVInputs:")
            print(BVInputs)
            if len(BVInputs) == 1:
                return True
            else:
                return False
        if self.value == self.bvextract.value:
            BVInputs = self.getBVOpInputs(Inputs)
            print("BVInputs:")
            print(BVInputs)
            if not isinstance(Inputs[3], RoseValues.RoseConstant):
                return False
            if len(BVInputs) != 1:
                return False
            if BVInputs[0].getType().getBitwidth() < Inputs[3].getValue():
                return False
            return True
        if self.value == self.bvinsert.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if not isinstance(Inputs[4], RoseValues.RoseConstant):
                print("false1")
                return False
            if len(BVInputs) != 2:
                print("false2")
                return False
            if BVInputs[0].getType().getBitwidth() != Inputs[4].getValue():
                print("false3")
                return False
            if BVInputs[1].getType().getBitwidth() < Inputs[4].getValue():
                print("false4")
                return False
            return True
        if self.value == self.bvsignextend.value \
        or self.value == self.bvzeroextend.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if not isinstance(Inputs[1], RoseValues.RoseConstant):
                return False
            if Inputs[1].getValue() <= BVInputs[0].getType().getBitwidth():
                return False
            if len(BVInputs) == 1:
                return True
            else:
                return False
        if self.value == self.bvsizeextend.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if not isinstance(Inputs[1], RoseValues.RoseConstant):
                return False
            if not isinstance(Inputs[2], RoseValues.RoseConstant):
                return False
            if Inputs[1].getValue() <= BVInputs[0].getType().getBitwidth():
                return False
            if len(BVInputs) == 1:
                return True
            else:
                return False
        if self.value == self.bvssat.value \
        or self.value == self.bvusat.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if not isinstance(Inputs[1], RoseValues.RoseConstant):
                return False
            if Inputs[1].getValue() > BVInputs[0].getType().getBitwidth():
                return False
            if len(BVInputs) == 1:
                return True
            else:
                return False
        if self.value == self.bvtrunclow.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if not isinstance(Inputs[1], RoseValues.RoseConstant):
                return False
            if Inputs[1].getValue() >= BVInputs[0].getType().getBitwidth():
                return False
            if len(BVInputs) == 1:
                return True
            else:
                return False
        if self.value == self.bvtrunchigh.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if not isinstance(Inputs[1], RoseValues.RoseConstant):
                return False
            if Inputs[1].getValue() >= BVInputs[0].getType().getBitwidth():
                return False
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
            if len(BVInputs) == 2:
                return True
            else:
                return False
        if self.value == self.call.value:
            Callee = Inputs[0]
            if len(Inputs) > 1:
                return self.callInputsAreValid(Callee, Inputs[1:])
            return self.callInputsAreValid(Callee, [])
        if self.value == self.opaquecall.value:
            Callee = Inputs[1]
            if not isinstance(Callee, RoseValues.RoseConstant):
                return False
            if not isinstance(Callee.getType(), RoseStringType):
                return False
            if not isinstance(Inputs[0], RoseType):
                return False
            return True
        if self.value == self.bvpadhighbits.value:
            BVInputs = self.getBVOpInputs(Inputs)
            if len(BVInputs) != 1:
                return False
            if not isinstance(Inputs[1], RoseValues.RoseConstant):
                return False
            return True
        if self.value == self.select.value:
            return self.selectInputsAreValid(Inputs)
        if self.value == self.ret.value:
            assert isinstance(Inputs[0], RoseValue)
            return (len(Inputs) == 1)
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
            return True
        if self.value == self.abs.value:
            if len(Inputs) != 1:
                return False
            if not isinstance(Inputs[0].getType(), RoseIntegerType):
                return False
            return True
        if self.value == self.boolnot.value:
            if len(Inputs) != 1:
                return False
            if not isinstance(Inputs[0].getType(), RoseBooleanType):
                return False
            return True
        if self.value == self.booland.value \
        or self.value == self.boolnand.value \
        or self.value == self.boolor.value \
        or self.value == self.boolnor.value:
            if not (len(Inputs) > 1):
                return False
            for Input in Inputs:
                if not isinstance(Input.getType(), RoseBooleanType):
                    return False
            return True
        if self.value == self.boolxor.value:
            if len(Inputs) != 2:
                return False
            if not isinstance(Inputs[0].getType(), RoseBooleanType):
                return False
            if not isinstance(Inputs[1].getType(), RoseBooleanType):
                return False
            return True
        if self.value == self.cast.value:
            return self.castInputsAreValid(Inputs)   
        if self.value == self.bvabs.value:
            if len(Inputs) != 1:
                return False
            if not isinstance(Inputs[0].getType(), RoseBitVectorType):
                return False
            return True
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
        or self.value == self.boolnot.value \
        or self.value == self.booland.value \
        or self.value == self.boolnand.value \
        or self.value == self.boolor.value \
        or self.value == self.boolnor.value \
        or self.value == self.boolxor.value \
        or self.value == self.add.value \
        or self.value == self.sub.value \
        or self.value == self.mul.value \
        or self.value == self.min.value \
        or self.value == self.max.value \
        or self.value == self.div.value \
        or self.value == self.rem.value \
        or self.value == self.mod.value \
        or self.value == self.abs.value \
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
        or self.value == self.bvtrunclow.value \
        or self.value == self.bvtrunchigh.value \
        or self.value == self.bvsignextend.value \
        or self.value == self.bvzeroextend.value \
        or self.value == self.bvsizeextend.value \
        or self.value == self.ret.value:
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
        or self.value == self.booland.value \
        or self.value == self.boolnand.value \
        or self.value == self.boolor.value \
        or self.value == self.boolnor.value \
        or self.value == self.boolxor.value \
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
        or self.value == self.greaterthanequal.value\
        or self.value == self.cast.value:
            return True
        if self.value == self.bvextract.value \
        or self.value == self.bvinsert.value \
        or self.value == self.bvsignextend.value \
        or self.value == self.bvzeroextend.value \
        or self.value == self.bvsizeextend.value \
        or self.value == self.bvssat.value \
        or self.value == self.bvusat.value \
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
        or self.value == self.lsb.value \
        or self.value == self.msb.value \
        or self.value == self.bvzero.value \
        or self.value == self.bvadd1.value \
        or self.value == self.bvsub1.value \
        or self.value == self.rotateleft.value \
        or self.value == self.boolnot.value \
        or self.value == self.rotateright.value:
            return False
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
        or self.value == self.bvsizeextend.value:
            return (NumInputs == 3)
        if self.value == self.call.value \
        or self.value == self.opaquecall.value:
            return (NumInputs >= 2)
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
        if self.value == self.boolnot.value:
            return (NumInputs == 1)
        if self.value == self.booland.value \
        or self.value == self.boolnand.value \
        or self.value == self.boolor.value \
        or self.value == self.boolnor.value:
            return (NumInputs > 1)
        if self.value == self.boolxor.value:
           return (NumInputs == 2)
        if self.value == self.cast.value:
           return (NumInputs == 2)      
        if self.value == self.bvabs.value:
            return (NumInputs == 1)
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
        or self.value == self.rotateleft.value \
        or self.value == self.rotateright.value \
        or self.value == self.bvextract.value \
        or self.value == self.bvinsert.value \
        or self.value == self.bvsignextend.value \
        or self.value == self.bvzeroextend.value \
        or self.value == self.bvsizeextend.value \
        or self.value == self.bvssat.value \
        or self.value == self.bvusat.value \
        or self.value == self.bvtrunclow.value \
        or self.value == self.bvtrunchigh.value \
        or self.value == self.bvpadhighbits.value:
            return True
        return False

    def isSizeChangingOp(self):
        if self.value == self.bvsignextend.value \
        or self.value == self.bvzeroextend.value \
        or self.value == self.bvsizeextend.value \
        or self.value == self.bvssat.value \
        or self.value == self.bvusat.value \
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
        or self.value == self.bvzero.value \
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
        if self.value == self.boolnot.value:
            return "not"
        if self.value == self.booland.value:
            return "and"
        if self.value == self.boolnand.value:
            return "nand"
        if self.value == self.boolor.value:
            return "or"
        if self.value == self.boolnor.value:
            return "nor"
        if self.value == self.boolxor.value:
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
        or self.value == self.bvsizeextend.value \
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
        or self.value == self.bvabs.value:
            assert False, "No direct conversion to Rosette Ops"
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
        assert self.value == self.select.value
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
        return True
    
    def castInputsAreValid(self, Inputs: list):
        assert self.value == self.cast.value
        if len(Inputs) != 2:
            return False
        if not isinstance(Inputs[0], RoseValue):
            return False
        if not isinstance(Inputs[1], RoseType):
            return False
        # If the types of inputs are equal, then this operation is not valid
        print(Inputs[0].getType())
        print(Inputs[1])
        if Inputs[0].getType() == Inputs[1]:
            return False
        # Valid input types are integers, bitvectors and booleans
        if not (isinstance(Inputs[0].getType(), RoseBooleanType) \
            or isinstance(Inputs[0].getType(), RoseBitVectorType) \
            or isinstance(Inputs[0].getType(), RoseIntegerType)):
            return False
        if not (isinstance(Inputs[1], RoseBooleanType) \
            or isinstance(Inputs[1], RoseBitVectorType) \
            or isinstance(Inputs[1], RoseIntegerType)):
            return False
        if Inputs[0].getType().getBitwidth() != Inputs[1].getBitwidth():
            return False
        return True


# Let's see how this could be useful
class HighOrderFunctions(Enum):
    apply = auto()
    map = auto()
    zip = auto()

    def __str__(self):
        return self.name



