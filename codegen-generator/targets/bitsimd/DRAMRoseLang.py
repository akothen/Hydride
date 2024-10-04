
#############################################################
#
# A tool for compiling DRAM semantics to Rosette IR.
#
#############################################################



from DRAM_Rosette_Emitter import CompileSemantics, DRAMRoseContext
from TOML_Utils import *
import glob



def CompileList(SemaList):
	from RoseFunctionInfo import RoseFunctionInfo
	FunctionInfoList = list()
	for Index, Spec in enumerate(SemaList):
		RootContext = DRAMRoseContext()
		print("RootContext---:")
		print(RootContext)
		print("Spec:")
		print(Spec)
		FunctionInfo = RoseFunctionInfo()
		CompiledFunction = CompileSemantics(Spec, RootContext)
		FunctionInfo.addContext(RootContext)
		FunctionInfo.addRawSemantics(Spec)
		FunctionInfo.addFunctionAtNewStage(CompiledFunction)
		print("Index*****")
		print(Index)
		print("CompiledFunction:")
		CompiledFunction.print()
		FunctionInfoList.append(FunctionInfo)

	return FunctionInfoList


# Need to debug these methods
SKIP = [
    "../ISA/16k_8_V_vfill.toml",
    "../ISA/16k_8_V_pimfill.toml",
    "../ISA/1_8_V_pimredprod.toml",
]


def Compile(InstName : str = None):
    fnames = glob.glob("../LibPimSim/*.toml")

    fnames = [f for f in fnames if f not in SKIP]


    sema_list = []

    for fname in fnames:
        print("Processing:", fname)
        toml_desc = read_inst_desc_from_toml(fname)
        pairs = get_inst_templates(toml_desc)
        tupple = pairs[0]

        for inst_desc in tupple[1]:
            sema = GetSemaFromTOML(inst_desc)
            sema_list.append(sema)

    print("Number of target specific contexts: ", len(sema_list))
    return CompileList(sema_list)

if __name__ == "__main__":
    Compile()
