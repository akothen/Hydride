##############################################################
#
# This is the implementation of alias analysis that checks
# whether given bitslices overlap or not, or whether they
# are contiguous.
#
##############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *


from enum import Enum, auto


class RoseAliasAnalysis:
    class AnalysisResults(Enum):
        NoAlias = auto()
        Alias = auto()
        PartialAlias = auto()
        Contiguous = auto()
        NonContiguous = auto()
        Unknown = auto()

    @staticmethod
    def alias(BVOp1: RoseBitVectorOp, BVOp2: RoseBitVectorOp):
        print("CHECK IF BIT SLICES ARE CONTIGUOUS")
        # Some sanity checks
        assert isinstance(BVOp1, RoseBVInsertSliceOp) or isinstance(
            BVOp1, RoseBVExtractSliceOp)
        assert isinstance(BVOp2, RoseBVInsertSliceOp) or isinstance(
            BVOp2, RoseBVExtractSliceOp)
        # assert BVOp1.getOutputBitwidth() == BVOp2.getOutputBitwidth()
        print("BVOp1:")
        BVOp1.print()
        print("BVOp2:")
        BVOp2.print()
        Low1 = BVOp1.getLowIndex()
        Low2 = BVOp2.getLowIndex()
        # Expected difference between the low indices of the bitvectos
        Bitwidth = BVOp1.getOutputBitwidth()

        # Function used to strip off casts, and sign and zero extensions
        def StripCastsAndSizeExtension(X: RoseOperation):
            if isinstance(X, RoseCastOp) \
                    or isinstance(X, RoseBVSignExtendOp) \
                    or isinstance(X, RoseBVZeroExtendOp):
                return X.getOperand(0)
            return X

        # Strip any casts and size extensions away
        Low1 = StripCastsAndSizeExtension(Low1)
        Low2 = StripCastsAndSizeExtension(Low2)
        print("LOW1:")
        Low1.print()
        print("LOW2:")
        Low2.print()
        # Handle easiest case first
        if isinstance(Low1, RoseConstant) and isinstance(Low2, RoseConstant):
            if (Low2.getValue() - Low1.getValue()) == Bitwidth:
                return RoseAliasAnalysis.AnalysisResults.Contiguous
            print("^^^^FALSE1")
            return RoseAliasAnalysis.AnalysisResults.Unknown

        # Either both low indices are constants or both are variables/operations.
        # Other cases are not taken into account.
        assert not isinstance(Low1, RoseConstant)
        assert not isinstance(Low2, RoseConstant)

        if isinstance(Low2.getOperand(0), RoseConstant) \
                or isinstance(Low2.getOperand(1), RoseConstant):
            # Just handle one _very_ common case where low2 = i + some_constant
            # Strip away any cast first
            # assert isinstance(Low2, RoseAddOp)
            if not isinstance(Low2, RoseAddOp):
                print("^^^^FALSE2")
                return RoseAliasAnalysis.AnalysisResults.Unknown
            print("LOW1:")
            Low1.print()
            print("LOW2:")
            Low2.print()
            if isinstance(Low2.getOperand(0), RoseConstant):
                Low2IndexValue = Low2.getOperand(1)
                ConstantLow2Index = Low2.getOperand(0)
            else:
                assert isinstance(Low2.getOperand(1), RoseConstant)
                Low2IndexValue = Low2.getOperand(0)
                ConstantLow2Index = Low2.getOperand(1)
            # Strip any casts away
            Low2IndexValue = StripCastsAndSizeExtension(Low2IndexValue)
            # High index is expressed in terms of low index
            # TODO: Make this more general.
            print("Low2IndexValue:")
            Low2IndexValue.print()
            Low2IndexValue.getType().print()
            print("Low1:")
            Low1.print()
            Low1.getType().print()

            # Just handle one _very_ common case where low1 = i
            if isinstance(Low2IndexValue, RoseOperation) and isinstance(Low1, RoseOperation):
                if Low1.isSameAs(Low2IndexValue):
                    if ConstantLow2Index.getValue() == Bitwidth:
                        return RoseAliasAnalysis.AnalysisResults.Contiguous
                    print("^^^^FALSE3")
                    return RoseAliasAnalysis.AnalysisResults.Unknown
                # Now handle a rare case where low1 = i + some_constant
                # assert isinstance(Low1, RoseAddOp)
                if not isinstance(Low1, RoseAddOp):
                    print("^^^^FALSE4")
                    return RoseAliasAnalysis.AnalysisResults.Unknown
                if isinstance(Low1.getOperand(0), RoseConstant):
                    Low1IndexValue = Low1.getOperand(1)
                    ConstantLow1Index = Low1.getOperand(0)
                else:
                    assert isinstance(Low1.getOperand(1), RoseConstant)
                    Low1IndexValue = Low1.getOperand(0)
                    ConstantLow1Index = Low1.getOperand(1)
                # Strip any casts away
                Low1IndexValue = StripCastsAndSizeExtension(Low1IndexValue)
                assert Low1IndexValue.isSameAs(Low2IndexValue)
                assert ConstantLow2Index.getValue() >= ConstantLow1Index.getValue()
                if (ConstantLow2Index.getValue() - ConstantLow1Index.getValue()) == Bitwidth:
                    return RoseAliasAnalysis.AnalysisResults.Contiguous
                print("^^^^FALSE5")
                return RoseAliasAnalysis.AnalysisResults.Unknown

            # Check if Low2IndexValue and low1 are equal
            if Low1 == Low2IndexValue and ConstantLow2Index.getValue() == Bitwidth:
                return RoseAliasAnalysis.AnalysisResults.Contiguous
            print("^^^^FALSE6")
            return RoseAliasAnalysis.AnalysisResults.Unknown

        # Now trace back to see if the operations in both cases match
        FullTrace1 = list()
        FullTrace2 = list()
        OpTrace1 = [Low1]
        OpTrace2 = [Low2]
        while len(OpTrace1) != 0 and len(OpTrace2) != 0:
            assert len(OpTrace1) == len(OpTrace2)
            Trace1Op = OpTrace1.pop()
            Trace2Op = OpTrace2.pop()
            print("Trace1Op:")
            Trace1Op.print()
            print("Trace2Op:")
            Trace2Op.print()
            FullTrace1.append(Trace1Op)
            FullTrace2.append(Trace2Op)
            if type(Trace1Op) != type(Trace2Op):
                print("^^^^FALSE7")
                return RoseAliasAnalysis.AnalysisResults.Unknown
            # The types of the operands of these ops must be the same too
            assert Trace1Op.getOpcode().typesOfInputsAndOutputEqual() \
                or Trace1Op.getOpcode().typesOfOperandsAreEqual()
            assert Trace2Op.getOpcode().typesOfInputsAndOutputEqual() \
                or Trace2Op.getOpcode().typesOfOperandsAreEqual()
            assert len(Trace1Op.getOperands()) == 2
            assert len(Trace2Op.getOperands()) == 2
            if type(Trace1Op.getOperand(0)) != type(Trace2Op.getOperand(0)):
                # Try again
                if type(Trace1Op.getOperand(0)) != type(Trace2Op.getOperand(1)):
                    print("^^^^FALSE8")
                    return RoseAliasAnalysis.AnalysisResults.Unknown
                if type(Trace1Op.getOperand(1)) != type(Trace2Op.getOperand(2)):
                    print("^^^^FALSE9")
                    return RoseAliasAnalysis.AnalysisResults.Unknown
                if isinstance(Trace1Op.getOperand(0), RoseOperation):
                    assert isinstance(Trace2Op.getOperand(1), RoseOperation)
                    OpTrace1.append(Trace1Op.getOperand(0))
                    OpTrace2.append(Trace2Op.getOperand(1))
                if isinstance(Trace1Op.getOperand(1), RoseOperation):
                    assert isinstance(Trace2Op.getOperand(0), RoseOperation)
                    OpTrace1.append(Trace1Op.getOperand(1))
                    OpTrace2.append(Trace2Op.getOperand(0))
            else:
                if type(Trace1Op.getOperand(1)) != type(Trace2Op.getOperand(1)):
                    print("^^^^FALSE10")
                    return RoseAliasAnalysis.AnalysisResults.Unknown
                if isinstance(Trace1Op.getOperand(0), RoseOperation):
                    assert isinstance(Trace2Op.getOperand(0), RoseOperation)
                    OpTrace1.append(Trace1Op.getOperand(0))
                    OpTrace2.append(Trace2Op.getOperand(0))
                if isinstance(Trace1Op.getOperand(1), RoseOperation):
                    assert isinstance(Trace2Op.getOperand(1), RoseOperation)
                    OpTrace1.append(Trace1Op.getOperand(1))
                    OpTrace2.append(Trace2Op.getOperand(1))
            # Now check if these operationns are same as each other
            if Trace1Op.isSameAs(Trace2Op):
                # These ops must have one use in add op.
                AptUserFound = False
                for User in Trace1Op.getUsers():
                    if isinstance(User, RoseAddOp):
                        if User in FullTrace1:
                            AptUserFound = True
                            break
                if AptUserFound == False:
                    continue
                AptUserFound = False
                for User in Trace2Op.getUsers():
                    if isinstance(User, RoseAddOp):
                        if User in FullTrace2:
                            AptUserFound = True
                            break
                if AptUserFound == False:
                    continue
            # Now see if, after simplifying these ops, we get
            # a difference of values that is equivalent to the
            # bitwidth of the operation(s) for which these ops
            # serve as indexing ops.
            ClonedTrace1Op = Trace1Op.cloneOperation()
            ClonedTrace2Op = Trace2Op.cloneOperation()
            SimplifiedClonedTrace1Op = ClonedTrace1Op.simplify()
            SimplifiedClonedTrace2Op = ClonedTrace2Op.simplify()
            print("ClonedTrace1Op:")
            ClonedTrace1Op.print()
            print("SimplifiedClonedTrace1Op:")
            SimplifiedClonedTrace1Op.print()
            print("ClonedTrace2Op:")
            ClonedTrace2Op.print()
            print("SimplifiedClonedTrace2Op:")
            SimplifiedClonedTrace2Op.print()
            if isinstance(SimplifiedClonedTrace1Op, RoseConstant) \
                    and isinstance(SimplifiedClonedTrace2Op, RoseConstant):
                if SimplifiedClonedTrace1Op.getValue() > SimplifiedClonedTrace2Op.getValue():
                    if SimplifiedClonedTrace1Op.getValue() \
                            - SimplifiedClonedTrace2Op.getValue() == BVOp2.getOutputBitwidth():
                        print("CONTIGUOUS!!!!")
                        return RoseAliasAnalysis.AnalysisResults.Contiguous
                if SimplifiedClonedTrace1Op.getValue() < SimplifiedClonedTrace2Op.getValue():
                    if SimplifiedClonedTrace2Op.getValue() \
                            - SimplifiedClonedTrace1Op.getValue() == BVOp2.getOutputBitwidth():
                        print("CONTIGUOUS!!!!")
                        return RoseAliasAnalysis.AnalysisResults.Contiguous
                print("^^^^FALSE11")
                return RoseAliasAnalysis.AnalysisResults.NonContiguous
        print("^^^^FALSE12")
        return RoseAliasAnalysis.AnalysisResults.Unknown
