###################################################################
#
# Functions shared betweeen the HVX parser and compiler
#
###################################################################


HVXVectorWidth = 1024


def VWIDTH():
  return HVXVectorWidth


def VELEM(Width):
  assert Width % 2 == 0
  return ((HVXVectorWidth * 8) / Width)
