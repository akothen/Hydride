
import x86RoseLang

import RoseCSE
import RoseLoopReroller
import RoseFunctionInliner


if __name__ == '__main__':
  Function = x86RoseLang.Compile()
  RoseCSE.Run(Function)
  RoseLoopReroller.Run(Function)
  RoseCSE.Run(Function)
  RoseFunctionInliner.Run(Function)



