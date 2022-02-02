###################################################################
#
# Functions shared betweeen the HVX parser and compiler
#
###################################################################

# HVX vector width in bits
HVXVectorWidth = 1024

def VWIDTH():
  return (HVXVectorWidth / 8)


def VELEM(Width : int):
  assert Width % 2 == 0
  return int(HVXVectorWidth / Width)


