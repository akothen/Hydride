from enum import Enum


class Base_Type(Enum):
    BITS = 0
    INT = 1
    ICONST = 3
    FP = 2
    UNKNOWN = 4


class Builtin_Type():
    def __init__(self, name, size, signed, vec, base_type):
        self.name = name
        self.size = size
        self.signed = signed
        self.vec = vec
        self.base_type = base_type

        self.sliced = False
        
    def to_str(self):
        return self.name

    def is_vec(self):
        return self.vec

    def get_size(self):
        return self.size

    def is_signed(self):
        return self.signed

    def bit_based(self):
        return (self.base_type
                == Base_Type.BITS) or (self.base_type
                                       == Base_Type.UNKNOWN) or (self.vec)

    def int_based(self):
        return (self.base_type == Base_Type.INT) or (
            self.base_type == Base_Type.ICONST) or (self.base_type
                                                    == Base_Type.UNKNOWN)

    def fp_based(self):
        return (self.base_type == Base_Type.FP) or (self.base_type
                                                    == Base_Type.UNKNOWN)

    def fp_pure(self):
        return (self.base_type == Base_Type.FP) and (self.vec is False)

    def is_unknown(self):
        return self.base_type == Base_Type.UNKNOWN

    def is_iconst(self):
        return self.base_type == Base_Type.ICONST or self.base_type == Base_Type.UNKNOWN

    def get_value(self):
        return self.name

    def dump(self):
        return "Name : {}\nSize : {}\nSign : {}\nBase : {}\nVec  : {}\nSlice: {}\n".format(
            self.name, self.size, self.signed, self.base_type, self.vec,
            self.sliced)


def Builtin_Type_Empty(name):
    return Builtin_Type(name, None, None, False, Base_Type.UNKNOWN)


def Builtin_Type_I32(name):
    return Builtin_Type(name, 32, True, False, Base_Type.INT)


def Builtin_Type_ICONST(name):
    return Builtin_Type(name, 8, True, False, Base_Type.ICONST)
