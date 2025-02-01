import argparse
import logging
import os
import re
from collections import namedtuple

AIESema = namedtuple(
    "AIESema",
    [
        "intrin",
        "params",
        "instclass",
        "conf", # bool
        "rettype",
    ],
)

AIEDoc = namedtuple('AIEDoc', [
                     'Name', 'Semantics', 'Description', 'Text'])

Parameter = namedtuple("Parameter", ["name", "type", "is_signed"])

AIEDIR = os.environ.get("HYDRIDE_ROOT") + "/codegen-generator/targets/aievec/"

SupportedTypes = [
    "int8",
    "uint8",
    "int4",
    "uint4",
    "int32",
    "uint32",
    "int16",
    "uint16",
    "acc64",
    "acc32"
]

LaneSizes = {
    ''
}

DataTypeBits = {
    "int8" : 8,
    "uint8" : 8,
    "int4" : 4,
    "uint4" : 4,
    "int32" : 32,
    "uint32" : 32,
    "int16" : 16,
    "uint16" : 16,
    "acc64" : 64,
    "acc32" : 32
}
