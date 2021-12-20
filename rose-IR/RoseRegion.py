
# Abstract class representing a region.
# Regions can contain loops, function, blocks.
# Regions can be contained in functions and loops.
class RoseRegion:
    def __init__(self, Parent, Children : list):
        self.Parent = Parent
        self.Children = Children
    
    @staticmethod
    def create(self, Parent, Children : list):
        return RoseRegion(Parent, Children)
    
    def getChildren(self):
        return self.Children
    
    def getParent(self):
        return self.Parent
    
    def addChild(self, Child):
        self.Children.append(Child)

    def print(self):
        for Child in self.Children:
            Child.print()

