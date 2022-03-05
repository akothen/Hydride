
import x86RoseLang

import RoseCSE
import RoseDCE
import RoseLoopReroller
import RoseFunctionInliner
import RoseExtractConstants
import RoseCanonicalize
import RoseOpCombine
import RosetteGen


if __name__ == '__main__':
  Context, Function = x86RoseLang.Compile()
  RoseLoopReroller.Run(Function, Context)  
  #RoseFunctionInliner.Run(Function, Context)
  #RoseOpCombine.Run(Function, Context)
  #RoseCSE.Run(Function, Context)
  #RoseCanonicalize.Run(Function, Context)
  #RoseOpCombine.Run(Function, Context)
  #RoseCSE.Run(Function, Context)
  #RoseDCE.Run(Function, Context)
  #RoseExtractConstants.Run(Function, Context)
  #RosetteGen.CodeGen(Function)



