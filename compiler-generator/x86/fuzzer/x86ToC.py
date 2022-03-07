

def x86ToC(T):
  LookupTable = {
    "SI8": "int8_t",
    "char": "char",
    "SI16": "int16_t",
    "short": "short",
    "SI32": "int32_t",
    "int": "int",
    "const int": "const int",
    "_MM_PERM_ENUM": "_MM_PERM_ENUM",
    "SI64": "int64_t",
    "__int64": "int64_t",
    "UI8": "uint8_t",
    "UI16": "uint16_t",
    "unsigned short": "unsigned short",
    "UI32": "uint32_t",
    "unsigned int": "unsigned int",
    "UI64": "uint64_t",
    "unsigned __int64": "uint64_t",
    "unsigned long": "unsigned long",
    "double": "float",
    "float": "float",
    "FP32": "float",
    "FP64": "double",
    "__mmask8": "__mmask8",
    "__mmask16": "__mmask16",
    "__mmask32": "__mmask32",
    "__mmask64": "__mmask64",
    "MASK": "__mmask64",
    "M128": "__m128",
    "M256": "__m256",
    "M512": "__m512",
    "__m64": "__m64",
    "__m128": "__m128",
    "__m128i": "__m128i",
    "__m128d": "__m128d",
    "__m256": "__m256",
    "__m256d": "__m256d",
    "__m256i": "__m256i",
    "__m512": "__m512",
    "__m512i": "__m512i",
    "__m512d": "__m512d",
  }
  if T not in LookupTable:
      return T
  return LookupTable[T]

