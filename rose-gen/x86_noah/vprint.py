verbose = 0


def _vprint(vreq, s):
    global verbose
    if vreq <= verbose:
        print(s)


def vprint(s):
    _vprint(1, s)


def vvprint(s):
    _vprint(2, s)
