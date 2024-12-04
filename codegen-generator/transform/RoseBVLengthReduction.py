#############################################################
#
# This pass reduces length of relevant bitvector registers.
#
#############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseMatrixOperations import *
from RoseContext import *
from RoseUtilities import *


def RunBVLengthReductionOnFunction(Function: RoseFunction, Context: RoseContext):
  print("RUN BV LENGTH REDUCTION ON FUNCTION")
  print("FUNCTION:")
  Function.print()
  assert isinstance(Function, RoseFunction)
  # Check if the return value is coming from the extract op.
  ReturnVal = Function.getReturnValue()
  if isinstance(ReturnVal, RoseBVExtractSliceOp):
    Block = ReturnVal.getParent()
    if ReturnVal.getInputBitVector().getType().getBitwidth() == ReturnVal.getType().getBitwidth():
        # Replace the return value with the input bitvector in the return op
        assert ReturnVal.getNumUsers() == 1
        ReturnVal.replaceUsesWith(ReturnVal.getInputBitVector())
        Function.setRetVal(ReturnVal.getInputBitVector())
        # Just remove this extract op
        Block.eraseOperation(ReturnVal)
    elif not isinstance(ReturnVal.getInputBitVector(), RoseOperation) \
        and not isinstance(ReturnVal.getInputBitVector(), RoseArgument):
        # Get all the uses of the input vector of the return value
        Users = Function.getUsersOf(ReturnVal.getInputBitVector())
        NewReturnValue = RoseValue.create(Context.genName("%" + "dst"), ReturnVal.getType())
        # Replace all the return value input bitvectors with the new one.
        for User in Users:
            Index = User.getIndexForOperand(ReturnVal.getInputBitVector())
            assert isinstance(Index, int)
            User.setOperand(Index, NewReturnValue)
        # Just remove this extract op
        assert ReturnVal.getNumUsers() == 1
        ReturnVal.replaceUsesWith(NewReturnValue)
        Function.setRetVal(NewReturnValue)
        Block.eraseOperation(ReturnVal)
  else:
    # Now let's go through all the blocks and look for temporary registers that are
    # written to and count the number of bvinserts and size of the inserted slices.
    BlockToInsertsToTempRegs = dict()
    BlockList = Function.getRegionsOfType(RoseBlock)
    for Block in BlockList:
      # We will deal with nested functions later
      if Block.getFunction() != Function:
        continue
      # bvinserts to a temp register must be all in one block. We assert that here.
      TempRegToBlock = dict()
      TempReg = RoseUndefValue()
      for Op in Block:
        if isinstance(Op, RoseBVInsertSliceOp):
          # Check if the input vector for an insert vector is not a 
          # return value of the function, or is not used by an 
          # mtxinsertrow operation
          if Op.getInputBitVector() != Function.getReturnValue():
            MatrixInsertFound = False
            Checklist = [Op.getInputBitVector()]
            Worklist = list()
            for User in Function.getUsersOf(Op.getInputBitVector()):
              Worklist.append(User)
            while len(Worklist) != 0:
              User = Worklist.pop(0)
              print("User:")
              User.print()
              if isinstance(User, RoseMatrixInsertRowOp):
                for CheckVal in Checklist:
                  #if Op.getInputBitVector() == User.getElements():
                  if CheckVal == User.getElements():
                    MatrixInsertFound = True
                    break
              elif isinstance(User, (RoseBVPadLowBitsOp, RoseBVPadHighBitsOp)):
                Checklist.append(User)
                for User_ in Function.getUsersOf(User):
                  Worklist.append(User_)
            if MatrixInsertFound == False:
              print("TempReg:")
              TempReg.print()
              if isinstance(TempReg, RoseUndefValue):
                TempReg = Op.getInputBitVector()
              else:
                assert TempReg == Op.getInputBitVector()
              if Op.getInputBitVector() not in TempRegToBlock:
                TempRegToBlock[Op.getInputBitVector()] = Block
              else:
                assert Block == TempRegToBlock[Op.getInputBitVector()]
              if Block not in BlockToInsertsToTempRegs:
                BlockToInsertsToTempRegs[Block] = [Op]
              else:
                BlockToInsertsToTempRegs[Block].append(Op)
        # We do not expect the inserted bitslices to be extracted
        # in the same block.
        # if isinstance(Op, RoseBVExtractSliceOp):
        #  if not isinstance(TempReg, RoseUndefValue):
        #    if Op.getInputBitVector() == TempReg:
        #      del TempRegToBlock[TempReg]
        #      del BlockToInsertsToTempRegs[Block]
        #      break
    # Now fix the size of the temp registers if need be.
    print("\n\n-----FUNCTION:")
    Function.print()
    print("BlockToInsertsToTempRegs:")
    print(BlockToInsertsToTempRegs)
    for Block, InsertOps in BlockToInsertsToTempRegs.items():
      InsertedSize = 0
      for InsertOp in InsertOps:
        assert Block == InsertOp.getParent()
        print("----InsertOp:")
        InsertOp.print()
        InsertedSize += InsertOp.getOutputBitwidth()
        TempReg = InsertOp.getInputBitVector()
      if TempReg.getName() == 'result':  # Hotfix for ARM vaddhn_high_s16
        continue
      print("InsertedSize:")
      print(InsertedSize)
      print("TempReg.getType().getBitwidth():")
      print(TempReg.getType().getBitwidth())
      if TempReg.getType().getBitwidth() != InsertedSize:
        assert TempReg.getType().getBitwidth() > InsertedSize
        NewType = RoseBitVectorType.create(InsertedSize)
        NewTempReg = RoseValue.create(Context.genName(TempReg.getName()), NewType)
        # Replace all the temp registers with the new one.
        Users = Function.getUsersOf(TempReg)
        for User in Users:
          Index = User.getIndexForOperand(TempReg)
          assert isinstance(Index, int)
          User.setOperand(Index, NewTempReg)
  print("++++FUNCTION:")
  Function.print()


def RunBVLengthReduction(Function: RoseFunction, Context: RoseContext):
  RunBVLengthReductionOnFunction(Function, Context)
  for Abstraction in Function:
    # Run the pass on the nested function
    if isinstance(Abstraction, RoseFunction):
      RunBVLengthReduction(Abstraction, Context.getContextOfChildFunction(Abstraction))


# Runs a transformation
def Run(Function: RoseFunction, Context: RoseContext):
  RunBVLengthReduction(Function, Context)
  print("\n\n\n\n\n")
  Function.print()
