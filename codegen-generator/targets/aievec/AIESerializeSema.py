import os
import sys
from pathlib import Path
from AIEMeta import *
from typing import List
from AIESemaFromDocs import ParseAddSubHTML

class SemaGenerator:
    def __init__(self, deserialize=True) -> None:
        self.result = {}
        if deserialize:
            self.deserialize()

    def deserialize(self):
        from AllSema import AllSema
        self.result = AllSema

    def serialize(self):
        import pprint
        self.result = self.getResult()
        with open(AIEDIR+'AIEAllSema.py', 'w') as f:
            f.write("""from AIEMeta import AIESema, AIEParameter\n\n""")
            f.write(f"AllSema = {pprint.pformat(self.result, indent=4)}")

    def getResult(self) -> List[AIESema]:
        if self.result:
            return self.result
        AllSemantics = []

        AllSemantics += ParseAddSubHTML()
        for i in AllSemantics:
            self.result[i.intrin] = i
        return self.result

if __name__ == "__main__":
    S = SemaGenerator(deserialize=False)
    S.serialize()