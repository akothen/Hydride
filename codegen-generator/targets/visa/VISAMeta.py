import re
from collections import namedtuple
VISASema = namedtuple('VISASema', [
    'intrin', 'inst', 'params',
    'spec', 'rettype', 'ret_is_signed',
    'inst_form',
    'extensions',
    'imm_width',
    'xed',
    'elem_type',
    'preparation',
    'resolving',
])
VISADoc = namedtuple('VISADoc', [
                     'Name', 'Opcode', 'Format', 'Semantics', 'Descritpion', 'Text', 'Notes'])
Parameter = namedtuple(
    'Parameter', ['name', 'type', 'is_signed', 'is_imm', 'is_mask'])
