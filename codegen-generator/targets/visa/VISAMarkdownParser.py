from VISAParser import SimpleParser
import os
import sys
from pathlib import Path
from VISAMeta import VISADoc
VISA_INSTRUCTIONS_DIR = Path(os.getenv('VISA_INSTRUCTIONS_DIR',
                                       "/home/muchenx2/igc/igc/documentation/visa/instructions"))
PARSE_ERROR_LIST = ['3D_LOAD', '3D_SAMPLE', '3D_SAMPLE4', 'AVS', 'BARRIER', 'CACHE_FLUSH', 'CALL', 'CMP', 'DPAS', 'DPASW', 'FADDR', 'FBH', 'FCALL', 'FCCALL', 'FENCE', 'FILE', 'FRET', 'GOTO', 'IFCALL', 'INFO', 'JMP', 'LABEL', 'LIFETIME', 'LOC',
                    'LSC_FENCE', 'LSC_TYPED', 'LSC_UNTYPED', 'NBARRIER',  'RAW_SEND', 'RAW_SENDS', 'RET', 'RT_READ', 'RT_WRITE', 'SAMPLE_UNORM', 'SBARRIER', 'SUBROUTINE', 'SVM', 'SWITCHJMP', 'TYPED_ATOMIC', 'URB_WRITE', 'VME_FBR', 'VME_IDM', 'VME_IME', 'VME_SIC', 'WAIT', 'YIELD']


def parseSemantics(text: str):
    for t in text.split('```'):
        if t.strip():
            sp = SimpleParser()
            sp.build()
            res = sp.parse(t)
            if sp.lex_error:
                raise Exception("Lex error")
            if sp.parse_error:
                raise Exception("Parse error")
            return res
            # return text


def parseMarkdown(mdname: str):
    Opcode = None
    Format = None
    Semantics = None
    Description = None
    Text = None
    Notes = None
    opName = mdname.split('.')[0]
    with open(VISA_INSTRUCTIONS_DIR/mdname, "r") as md:
        text = md.read()
        text = text.replace("####", "#*#*#*#*")
        text = text.replace("###", "#*#*#*")
        for part in text.split("##"):
            part = part.strip().split("\n")
            rem = '\n'.join(part[1:]).strip()
            if part[0] == 'Opcode':
                Opcode = rem
            elif part[0] == 'Format':
                Format = rem
            elif part[0] == 'Semantics':
                try:
                    Semantics = parseSemantics(rem)
                except Exception as e:
                    print(rem)
                    assert opName in PARSE_ERROR_LIST, rem
            elif part[0] == 'Description':
                Description = rem
            elif part[0] == 'Text':
                Text = rem
            elif part[0] == 'Notes':
                Notes = rem
            elif part[0].startswith("<!--"):
                pass
            elif part[0] == 'Examples':
                pass
            else:
                print(part[0])
                assert False
        return VISADoc(opName, Opcode, Format, Semantics, Description, Text, Notes)


if __name__ == "__main__":
    if 'export' in sys.argv:
        for mm in PARSE_ERROR_LIST:
            print('##', mm)
            parseMarkdown(f"{mm}.md")
    else:
        for mdname in os.listdir(VISA_INSTRUCTIONS_DIR):
            vsema = parseMarkdown(mdname)
    # parseMarkdown("CMP.md")
