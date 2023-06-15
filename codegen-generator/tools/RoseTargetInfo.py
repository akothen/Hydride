#############################################################
#
# This is the class that contains target information.
#
#############################################################


import uuid


class RoseTargetInfo:
    def __init__(self, TargetName: str):
        self.TargetName = TargetName
        self.ID = uuid.uuid4()

    def getTargetName(self):
        return self.TargetName

    def __hash__(self):
        return hash(self.ID)
