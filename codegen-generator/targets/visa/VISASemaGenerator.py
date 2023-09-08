from VISAParser import SimpleParser
from VISAAST import getSemaAsString
import os
import sys
from pathlib import Path
from VISAMeta import VISADoc, VISATextParse, SuppportedVISA
from VISAMarkdownParser import parseMarkdown


def SemaGenerator():
    '''
    ADD[.sat] (exec_size) <dst> <src0> <src1> -> 2*6*6*6

    CMP.rel_op  (<exec_size>) <dst> <src0> <src1> -> 6*6*6*6

    MIN[.sat] (<exec_size>) <dst> <src0> <src1> |
    MAX[.sat] (<exec_size>) <dst> <src0> <src1> -> 2*2*6*6*6
    '''
    for visa in SuppportedVISA:
        vdoc = parseMarkdown(f"{visa}.md")



if __name__ == "__main__":
    S = SemaGenerator()
