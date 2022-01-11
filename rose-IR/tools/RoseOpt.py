
import x86RoseLang

import RoseCSE
import RoseLoopReroller



if __name__ == '__main__':
  Function = x86RoseLang.Compile()
  RoseCSE.Run(Function)
  RoseLoopReroller.Run(Function)



