from enum import Enum


class Base_Type(Enum):
    BITS = 0
    INT = 1
    ICONST = 3
    FP = 2
    UNKNOWN = 4
    VEC_OF = 5


class Builtin_Type():
    def __init__(self, name, size, signed, vec, base_type):
        self.name = name
        self.size = size

        self.signed = signed
        
        self.vec = vec
        self.base_type = base_type
        self.sliced = False
        self.sliced_sz = None
        self.inner_T = None

    def to_str(self):
        self.valid_T()
        return self.name

    def valid_T(self):
        if self.vec:
            if self.inner_T is not None:
                assert Base_Type.VEC_OF == self.base_type, self.dump()
            else:
                assert Base_Type.UNKNOWN != self.base_type, self.dump()
        if self.sliced:
            assert self.sliced_sz is not None

    def is_vec(self):
        self.valid_T()
        return self.vec

    def get_size(self):
        self.valid_T()
        return self.size

    def is_signed(self):
        self.valid_T()
        return self.signed

    def base_type_copy(self):
        if self.is_vec() or self.bit_based():
            return Base_Type.BITS
        else:
            return self.base_type
    
    def bit_based(self):
        self.valid_T()
        return (self.base_type
                == Base_Type.BITS) or (self.base_type
                                       == Base_Type.UNKNOWN) or (self.vec)

    def int_based(self):
        self.valid_T()
        return (self.base_type == Base_Type.INT) or (
            self.base_type == Base_Type.ICONST) or (self.base_type
                                                    == Base_Type.UNKNOWN)

    def fp_based(self):
        self.valid_T()
        return (self.base_type == Base_Type.FP) or (self.base_type
                                                    == Base_Type.UNKNOWN)

    def fp_pure(self):
        self.valid_T()
        return (self.base_type == Base_Type.FP) and (self.vec is False)

    def is_unknown(self):
        self.valid_T()
        return self.base_type == Base_Type.UNKNOWN

    def is_iconst(self):
        self.valid_T()
        return self.base_type == Base_Type.ICONST or self.base_type == Base_Type.UNKNOWN

    def get_value(self):
        self.valid_T()
        return self.name

    def get_size(self):
        if self.size is None or self.size <= 0:
            return 1024
        return self.size

    def set_size(self, other):
        self.size = other.get_size()

    def dump(self):
        inner_dump = "N/A"
        sliced_sz_dump = "N/A"
        if self.inner_T is not None:
            inner_dump = self.inner_T.dump()
        if self.sliced_sz is not None:
            sliced_sz_dump = self.sliced_sz.to_str()

        return "Name : {}\nSize : {}\nSign : {}\nBase : {}\nSlice: {}\nSSize: {}\nVec  : {}\nInner: {}\n".format(
            self.name, self.size, self.signed, self.base_type, self.sliced,
            sliced_sz_dump, self.vec, inner_dump)


def Builtin_Type_Empty(name):
    ret_t = Builtin_Type(name, None, None, False, Base_Type.UNKNOWN)
    ret_t.valid_T()
    return ret_t


def Builtin_Type_I32(name):
    ret_t = Builtin_Type(name, 32, True, False, Base_Type.INT)
    ret_t.valid_T()
    return ret_t


def Builtin_Type_ICONST(name):
    ret_t = Builtin_Type(name, 8, True, False, Base_Type.ICONST)
    ret_t.valid_T()
    return ret_t
