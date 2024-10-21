#############################################################
#
# This pass translate Rose IR into textual Rosette code.
#
#############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseUtilities import *


def GetSkippedBVInsertIndexingOps(Operation: RoseBVInsertSliceOp):
    print("GetSkippedBVInsertIndexingOps")
    # Sanity checks
    assert isinstance(Operation, RoseBVInsertSliceOp)
    Worklist = list()
    ToBeSkipped = list()
    print("Operation:")
    Operation.print()
    if isinstance(Operation.getLowIndex(), RoseOperation):
        print("Operation.getLowIndex()")
        Operation.getLowIndex().print()
        if Operation.getLowIndex().getNumUsers() == 1:
            Worklist.append(Operation.getLowIndex())
            ToBeSkipped.append(Operation.getLowIndex())
    if isinstance(Operation.getHighIndex(), RoseOperation):
        print("Operation.getHighIndex()")
        Operation.getHighIndex().print()
        if Operation.getHighIndex().getNumUsers() == 1:
            Worklist.append(Operation.getHighIndex())
            ToBeSkipped.append(Operation.getHighIndex())
    # print(" INIT ToBeSkipped:")
    # for Op in ToBeSkipped:
    #  Op.print()
    while len(Worklist) != 0:
        IndexingOp = Worklist.pop()
        # print("IndexingOp:")
        # IndexingOp.print()
        if IndexingOp not in ToBeSkipped:
            continue
        if isinstance(IndexingOp, RoseOperation):
            for Operand in IndexingOp.getOperands():
                if isinstance(Operand, RoseOperation):
                    # This operand can be skipped if the users are
                    # ops to be skipped or the given bvinsert op itself.
                    CanBeSkipped = True
                    for User in Operand.getUsers():
                        if User not in ToBeSkipped \
                                and User != Operation:
                            CanBeSkipped = False
                            # print("CanBeSkipped is False")
                            # print("OPERAND;")
                            # Operand.print()
                            break
                    if CanBeSkipped == True:
                        ToBeSkipped.append(Operand)
                    Worklist.append(Operand)
    ToBeSkipped.reverse()
    print("ToBeSkipped:")
    for Op in ToBeSkipped:
      Op.print()
    print("++++++++++++++++++++++++")
    return ToBeSkipped


def GenerateRosetteForBlock(Block: RoseBlock, RosetteCode: str,
                            NumSpace=0, SkipOps=list()):
    print("GENERATE ROSETTE CODE FOR BLOCK")
    print("BLOCK:")
    print(Block)

    # Collect the indexing ops of bvinserts. These ops will be skipped
    # when generating Rosette code.
    SkippedIndexingOps = list()
    for Op in Block:
        if isinstance(Op, RoseBVInsertSliceOp):
            SkippedIndexingOps.extend(GetSkippedBVInsertIndexingOps(Op))

    BVInsertOpsList = list()
    Spaces = ""
    for _ in range(NumSpace):
        Spaces += " "
    LastOp = RoseUndefValue()
    for Operation in Block:
        print("Operation:")
        Operation.print()
        # Skip certain ops
        if Operation in SkipOps:
            print("SKIPPING OP")
            continue
        # May need to skip indexing op
        if Operation in SkippedIndexingOps:
            print("SKIPPING INDEX OP")
            continue
        # Ignore return ops
        if isinstance(Operation, RoseReturnOp):
            continue
        # Gather bvinsert ops
        if isinstance(Operation, RoseBVInsertSliceOp):
            if Block.getParentOfType(RoseForLoop) == RoseUndefRegion():
                RosetteCode += Spaces + "(define " + Operation.getInputBitVector().getName() \
                    + " " + Operation.getInsertValue().getName() + ")\n"
            else:
                BVInsertOpsList.append(Operation)
            continue
        LastOp = Operation
        # Skip emitting rosette code for op that pads high bits
        if isinstance(Operation, RoseBVPadHighBitsOp):
            continue
        print("--Operation:")
        Operation.print()
        # Conditional extracts have to be handled delicately.
        if isinstance(Operation, RoseBVExtractSliceOp):
          # Is this used in a select op?
          print("Operation.getParent().getFunction().getNumUsersOf(Operation):")
          print(Operation.getParent().getFunction().getNumUsersOf(Operation))
          if Operation.getParent().getFunction().getNumUsersOf(Operation) == 1:
            Users = Operation.getParent().getFunction().getUsersOf(Operation)
            if len(Users) == 1:
              User = Users[0]
              if isinstance(User, RoseSelectOp):
                # If the use is in the condition, we generate the extract op
                if User.getCondition() != Operation:
                # This is a conditional extract so we will skip emission of code for this one
                  continue
            else:
              # The number of users is 1, but the actual operations 
              # that are users are zero, in that case the user must 
              # be cond region. If so, do nothing but just emit code 
              # for this operation.
              assert len(Users) == 0
              # The bit slice length must be 1.
              assert Operation.getOutputBitwidth() == 1
        RosetteCode += Operation.to_rosette(NumSpace)

    if len(SkipOps) != 0:
        # print("SKIP SOME OPS")
        RosetteCode += Spaces + LastOp.getName() + "\n"
        return RosetteCode
    
    if not (len(BVInsertOpsList) > 1):
        if len(BVInsertOpsList) == 1:
            Block = BVInsertOpsList[0].getParent()
            if IsBlockPreheader(Block) == False:
                if isinstance(BVInsertOpsList[0].getInsertValue(), RoseConstant):
                    Result = bin(BVInsertOpsList[0].getInsertValue(
                    ).getValue()).replace("0b", "#b")
                    if type(BVInsertOpsList[0].getOutputBitwidth()) == int:
                        RosetteCode += Spaces + "(bv " + Result + " " \
                            + str(BVInsertOpsList[0].getOutputBitwidth()) + ")\n"
                    else:
                        RosetteCode += Spaces + "(bv " + Result + " " \
                            + BVInsertOpsList[0].getOutputBitwidth().getName() + ")\n"
                else:
                    RosetteCode += Spaces + \
                        BVInsertOpsList[0].getInsertValue().getName() + "\n"
            else:
                if isinstance(BVInsertOpsList[0].getInsertValue(), RoseConstant):
                    Result = bin(BVInsertOpsList[0].getInsertValue(
                    ).getValue()).replace("0b", "#b")
                    if type(BVInsertOpsList[0].getOutputBitwidth()) == int:
                        RosetteCode += Spaces + "(define " + BVInsertOpsList[0].getInputBitVector().getName() \
                            + " (bv " + Result + " " + \
                            str(BVInsertOpsList[0].getOutputBitwidth(
                            )) + "))\n"
                    else:
                        RosetteCode += Spaces + "(define " + BVInsertOpsList[0].getInputBitVector().getName() \
                            + " (bv " + Result + " " + BVInsertOpsList[0].getOutputBitwidth().getName() + "))\n"
                else:
                    RosetteCode += Spaces + "(define " + BVInsertOpsList[0].getInputBitVector().getName() \
                        + " " + \
                        BVInsertOpsList[0].getInsertValue().getName() + ")\n"
        return RosetteCode

    # See which bvinserts in the block are concatable
    ListOfPacks = list()
    Pack = list()
    for Op in BVInsertOpsList:
        if Pack == []:
            Pack = [Op]
            continue
        # print("AreBitSlicesContiguous:")
        # if not AreBitSlicesContiguous(Pack[len(Pack) - 1], Op):
        #  print("FALSE")
            # Pack list ends here
        #  ListOfPacks.append(Pack)
        #  Pack = [Op]
        #  continue
        # print("TRUE")
        # Add the op to the current pack list
        Pack.append(Op)
    if len(Pack) != 0:
        ListOfPacks.append(Pack)

    # TODO: Support multiple packlists in the list of packs
    # print(ListOfPacks)
    assert len(ListOfPacks) == 1
    # Now concatenate the packs
    RosetteCode += "(concat"
    # Reverse the pack list
    Pack.reverse()
    for Op in Pack:
        if isinstance(Op.getInsertValue(), RoseConstant):
            RosetteCode += " " + Op.getInsertValue().to_rosette()
        else:
            RosetteCode += " " + Op.getInsertValue().getName()
    RosetteCode += ")\n"
    return RosetteCode


def GenerateRosetteForCondRegion(CondRegion: RoseCond, RosetteCode: str, NumSpace: int = 0,
                                 VisitedLoop: set = set(), ReductionLoops: set = set(),
                                 SkipOpsMap: dict = dict()):
    # Generate the condition first
    Spaces = ""
    for _ in range(NumSpace):
        Spaces += " "

    assert len(CondRegion.getKeys()) > 1
    TmpRosetteCode = Spaces + "(cond\n"
    for Idx, Key in enumerate(CondRegion.getKeys()):
        if len(CondRegion.getConditions()) > Idx:
            if isinstance(CondRegion.getCondition(Idx).getType(), RoseBitVectorType):
                TmpRosetteCode += Spaces + \
                    "[(equal? {} (bv #b1 1))\n".format(
                        CondRegion.getCondition(Idx).getName())
            else:
                TmpRosetteCode += Spaces + \
                    "[(equal? {} #t)\n".format(
                        CondRegion.getCondition(Idx).getName())
            TmpRosetteCode += Spaces + " (begin\n"
        else:
            TmpRosetteCode += Spaces + "[else (begin\n"
        for Abstraction in CondRegion.getChildren(Key):
            if isinstance(Abstraction, RoseBlock):
                if Abstraction in SkipOpsMap:
                    TmpRosetteCode = GenerateRosetteForBlock(Abstraction, TmpRosetteCode, 
                                                                NumSpace + 1,
                                                                SkipOpsMap[Abstraction])
                else:
                    TmpRosetteCode = GenerateRosetteForBlock(
                        Abstraction, TmpRosetteCode, NumSpace + 1)
                continue
            if isinstance(Abstraction, RoseForLoop):
                TmpRosetteCode = GenerateRosetteForForLoop(Abstraction, TmpRosetteCode,
                                                           NumSpace + 1, VisitedLoop, 
                                                           ReductionLoops, SkipOpsMap)
                continue
            if isinstance(Abstraction, RoseCond):
                TmpRosetteCode = GenerateRosetteForCondRegion(Abstraction, TmpRosetteCode, 
                                                                NumSpace + 1, VisitedLoop, 
                                                                ReductionLoops, SkipOpsMap)
                continue
        TmpRosetteCode += Spaces + " )]\n"

    # print("RosetteCode after generating loop")
    # print(TmpRosetteCode)
    TmpRosetteCode += (Spaces + ")\n")
    RosetteCode += TmpRosetteCode
    return RosetteCode


def GenerateRosetteForForLoop(Loop: RoseForLoop, RosetteCode: str, NumSpace: int = 0,
                              VisitedLoop: set = set(), ReductionLoops: set = set(),
                              SkipOpsMap: dict = dict()):
    # print("GENERATING CODE FOR LOOP")
    if Loop not in VisitedLoop:
        # print("LOOP IS NOT VISITED")
        # Check if there is a reduction pattern to deal with.
        BlockList = Loop.getRegionsOfType(RoseBlock)
        ReductionBlockList = []
        for Block in BlockList:
            if HasReductionPattern(Block):
                ReductionBlockList.append(Block)
                # Get the immediate parent loop for this block
                ParentLoop = Block.getParentOfType(RoseForLoop)
                ReductionLoops.add(ParentLoop)
        if ReductionBlockList != []:
            LoopList = Loop.getRegionsOfType(RoseForLoop)
            VisitedLoop.update(LoopList)

        # Get all the operations to skip
        SkipOpsMap = dict()
        for Block in ReductionBlockList:
            # print("REDUCTION BLOCK:")
            Block.print()
            SkipOpsMap[Block] = []
            SkipOpsMap[Block].extend(GetReductionOps(Block))
            # print("REDUCTION OPS:")
            # for Op in SkipOpsMap[Block]:
            #  Op.print()

    # Generate loop header
    Spaces = ""
    # print(range(NumSpace))
    for _ in range(NumSpace):
        Spaces += " "
    TmpRosetteCode = Spaces + "(for/list ([" + Loop.getIterator().getName() \
        + " (reverse (range " + Loop.getStartIndex().getName() + " " \
        + Loop.getEndIndex().getName() + " " + Loop.getStep().getName() + "))])\n"
    # print("TmpRosetteCode:")
    # print(TmpRosetteCode)
    # We also keep track of whether this loop has multiple children loops,
    # in which case the results from the loops will need to be concatenated together.
    NumChildrenLoops = len(Loop.getRegionsOfType(RoseForLoop, Level=0))
    if NumChildrenLoops > 1:
        TmpRosetteCode += Spaces + " (concat \n"
        NumSpace += 1
        # If a loop has multiple loops, the order in which the loops are generated
        # must be reversed.
        for Abstraction in reversed(Loop.getChildren()):
            if isinstance(Abstraction, RoseForLoop):
                TmpRosetteCode = GenerateRosetteForForLoop(Abstraction, TmpRosetteCode,
                                                           NumSpace + 1, VisitedLoop, 
                                                           ReductionLoops, SkipOpsMap)
                continue
            if isinstance(Abstraction, RoseCond):
                TmpRosetteCode = GenerateRosetteForCondRegion(Abstraction, TmpRosetteCode, 
                                                              NumSpace + 1, VisitedLoop, 
                                                              ReductionLoops, SkipOpsMap)
                continue
            if isinstance(Abstraction, RoseBlock):
                if Abstraction in SkipOpsMap:
                    TmpRosetteCode = GenerateRosetteForBlock(Abstraction, TmpRosetteCode,
                                                             NumSpace + 1, SkipOpsMap[Abstraction])
                else:
                    TmpRosetteCode = GenerateRosetteForBlock(
                        Abstraction, TmpRosetteCode, NumSpace + 1)
                continue
    else:
        for Abstraction in Loop:
            if isinstance(Abstraction, RoseForLoop):
                TmpRosetteCode = GenerateRosetteForForLoop(Abstraction, TmpRosetteCode,
                                                           NumSpace + 1, VisitedLoop, 
                                                           ReductionLoops, SkipOpsMap)
                continue
            if isinstance(Abstraction, RoseCond):
                TmpRosetteCode = GenerateRosetteForCondRegion(Abstraction, TmpRosetteCode, 
                                                              NumSpace + 1, VisitedLoop, 
                                                              ReductionLoops, SkipOpsMap)
                continue
            if isinstance(Abstraction, RoseBlock):
                if Abstraction in SkipOpsMap:
                    TmpRosetteCode = GenerateRosetteForBlock(Abstraction, TmpRosetteCode,
                                                             NumSpace + 1, SkipOpsMap[Abstraction])
                else:
                    TmpRosetteCode = GenerateRosetteForBlock(
                        Abstraction, TmpRosetteCode, NumSpace + 1)
                continue
    # print("+++++TmpRosetteCode:")
    # print(TmpRosetteCode)
    if NumChildrenLoops > 1:
        TmpRosetteCode += (Spaces + " )\n")
    TmpRosetteCode += (Spaces + ")\n")
    # print("RosetteCode after generating loop")
    # print(TmpRosetteCode)

    if Loop in ReductionLoops:
        ReductionVal = RoseUndefValue()
        Epilogue = ""
        BlockList = Loop.getRegionsOfType(RoseBlock)
        # print("BlockList:")
        # print(BlockList)
        ReductionOpString = None
        for Block in BlockList:
            # Block.print()
            if Block in SkipOpsMap:
                Epilogue += "))\n"
                ExtractOp = RoseUndefValue()
                for Op in SkipOpsMap[Block]:
                    print("SkipOpsMap[Block]:")
                    Op.print()
                    if isinstance(Op, RoseBVExtractSliceOp):
                        # ExtractOp = Op
                        # Epilogue += Op.to_rosette(NumSpace)
                        ExtractOp = Op.getInputBitVector()
                        continue
                    if (Op.getOpcode().typesOfInputsAndOutputEqual() == True
                            or isinstance(Op, RoseGeneralSaturableBitVectorOp) == True) \
                            and isinstance(Op, RoseBitVectorOp):
                        for Operand in Op.getOperands():
                            if ExtractOp == Operand:
                                continue
                            ReductionVal = Operand
                            break
                        # print("******OP:")
                        # Op.print()
                        # ReductionOpString = Op.getOpcode().getRosetteOp()
                        if isinstance(Op, RoseSaturableBitVectorOp):
                            ReductionOpString = Op.getOpcode().getRosetteOp()
                            if Op.getSaturationQualifier() == None:
                                Epilogue += Spaces + "(define " + Op.getName() \
                                  + " (" + ReductionOpString + " " \
                                  + ReductionVal.getName() + ".red " + ExtractOp.getName() + "))\n"
                            else:
                                Epilogue += Spaces + "(define " + Op.getName() \
                                  + " (" + ReductionOpString  \
                                  + Op.getSaturationQualifier() + " " + ReductionVal.getName() + ".red " \
                                  + ExtractOp.getName() + " " + str(Op.getOutputBitwidth()) + "))\n"
                        elif isinstance(Op, RoseGeneralSaturableBitVectorOp):
                            ReductionOpString = Op.getRosetteName()
                            print("Op.getSaturationQualifierID():")
                            Op.getSaturationQualifierID().print()
                            if isinstance(Op.getSaturationQualifierID(), RoseConstant):
                                Epilogue += Spaces + "(define " + Op.getName() \
                                  + " (" + ReductionOpString  \
                                  + " " + ReductionVal.getName() + ".red " \
                                  + ExtractOp.getName() + " " + str(Op.getOutputBitwidth()) \
                                  + " " + str(Op.getSaturationQualifierID().getValue()) + "))\n"
                            else:
                                Epilogue += Spaces + "(define " + Op.getName() \
                                  + " (" + ReductionOpString  \
                                  + " " + ReductionVal.getName() + ".red " \
                                  + ExtractOp.getName() + " " + str(Op.getOutputBitwidth()) \
                                  + " " + Op.getSaturationQualifierID().getName() + "))\n"
                            ReductionOpString = Op.getSimpleRosetteName()
                        else:
                            ReductionOpString = Op.getOpcode().getRosetteOp()
                            Epilogue += Spaces + "(define " + Op.getName() \
                              + " (" + ReductionOpString + " " \
                              + ReductionVal.getName() + ".red " + ExtractOp.getName() + "))\n"
                        Epilogue += Spaces + Op.getName() + "\n"
                        break
                    if isinstance(Op, RoseBVInsertSliceOp):
                        continue
                    Epilogue += Op.to_rosette(NumSpace)
        print("Epilogue:")
        print(Epilogue)

        TmpRosetteCode += Epilogue
        # print("ReductionLoops:")
        # for L in ReductionLoops:
        #  L.print()
        TmpRosetteCode = Spaces + "(define " + ReductionVal.getName() + ".red\n" \
            + "(apply\n" + Spaces + ReductionOpString + "\n" + TmpRosetteCode
    else:
        TmpRosetteCode = Spaces + "(apply\n" + \
            Spaces + "concat\n" + TmpRosetteCode
        TmpRosetteCode += (Spaces + ")\n")
    RosetteCode += TmpRosetteCode
    return RosetteCode


def GenerateRosetteForRegion(Region, RosetteCode: str, NumSpace=0):
    # Iterate over all the contents of this function
    assert not isinstance(Region, RoseBlock)
    for Abstraction in Region:
        # Generate Rosette for a nested function
        if isinstance(Abstraction, RoseFunction):
            RosetteCode = GenerateRosetteForFunction(
                Abstraction, RosetteCode, NumSpace)
            continue
        # Generate Rosette for a loop
        if isinstance(Abstraction, RoseForLoop):
            LoopRosetteCode = GenerateRosetteForForLoop(
                Abstraction, "", NumSpace)
            # Check what variable to wrap the outer loop around.
            BlockList = Abstraction.getRegionsOfType(RoseBlock)
            Variable = RoseUndefValue()
            for Block in BlockList:
                for Op in Block:
                    if isinstance(Op, RoseBVInsertSliceOp):
                        # print("VARIABLE:")
                        # Variable.print()
                        # print("Op.getInputBitVector():")
                        # Op.getInputBitVector().print()
                        Variable = Op.getInputBitVector()
                        # if isinstance(Variable, RoseUndefValue):
                        #  Variable = Op.getInputBitVector()
                        # else:
                        #  assert Variable == Op.getInputBitVector()
            assert not isinstance(Variable, RoseUndefValue)
            # Now emit a variable definition
            Spaces = ""
            for _ in range(NumSpace):
                Spaces += " "
            LoopRosetteCode = Spaces + "(define " + Variable.getName() \
                + "\n" + LoopRosetteCode
            LoopRosetteCode += Spaces + ")\n"
            # print("LoopRosetteCode:")
            # print(LoopRosetteCode)
            RosetteCode += LoopRosetteCode
            # print("RosetteCode:")
            # print(RosetteCode)
            continue
        # Generate Rosette for block
        if isinstance(Abstraction, RoseBlock):
            RosetteCode = GenerateRosetteForBlock(
                Abstraction, RosetteCode, NumSpace)
            continue
        RosetteCode = GenerateRosetteForRegion(
            Abstraction, RosetteCode, NumSpace)
    return RosetteCode


def GenerateRosetteForFunction(Function: RoseFunction, RosetteCode: str, NumSpace=0):
    # print("GENERATE ROSETTE FUNCTION")
    # print("FUNCTION:")
    # Function.print()
    # Generate function header
    Spaces = ""
    for _ in range(NumSpace):
        Spaces += " "
    RosetteCode += Spaces + "(define (" + Function.getName() + " "
    for Arg in Function.getArgs():
        RosetteCode += " " + Arg.getName()
    RosetteCode += " )\n"
    # Generate Rosette code for the given function
    # if Function.getReturnValue() != RoseUndefValue():
    #  RosetteCode += "(define  " + Function.getReturnValue().getName() + "\n"
    FunctionBody = ""
    FunctionBody = GenerateRosetteForRegion(Function, FunctionBody)
    # print("RosetteCode after region")
    # print(RosetteCode)
    # print("FunctionBody:")
    # print(FunctionBody)
    # if Function.getReturnValue() != RoseUndefValue():
    # RosetteCode += ")\n"
    # RosetteCode += Function.getReturnValue().getName() + "\n"
    # Now check if the function has any op for padding high bits in the end
    BlockList = Function.getRegionsOfType(RoseBlock)
    FoundHighBitsPaddingOp = False
    for Block in reversed(BlockList):
        for Op in reversed(Block.getOperations()):
            if isinstance(Op, RoseBVPadHighBitsOp):
                # Emit rosette code
                FunctionBody += Op.to_rosette(NumSpace)
                # print("FunctionBody")
                # print(FunctionBody)
                FoundHighBitsPaddingOp = True
                break
        if FoundHighBitsPaddingOp == True:
            break
    if FoundHighBitsPaddingOp == False:
        FunctionBody += Spaces + Function.getReturnValue().getName()
    RosetteCode += FunctionBody
    RosetteCode += (Spaces + ")\n")
    return RosetteCode


# Translates the given Rose IR function into Rosette
def CodeGen(Function: RoseFunction):
    RosetteCode = ""
    RosetteCode = GenerateRosetteForFunction(Function, RosetteCode)
    print("---\n\n\n\n\n")
    print("GENERATE ROSETTE FUNCTION")
    Function.print()
    print("---\n\n\n\n\n")
    print(RosetteCode)
    return RosetteCode
