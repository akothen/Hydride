###################################################################
#
# Functions shared betweeen the HVX parser and compiler
#
###################################################################

# HVX vector width in bits
HVXVectorWidth = 1024

def VWIDTH():
  return (HVXVectorWidth / 8)

def VBITS():
  return HVXVectorWidth

def VELEM(BitWidth : int):
  assert BitWidth % 2 == 0
  return int(HVXVectorWidth / BitWidth)



