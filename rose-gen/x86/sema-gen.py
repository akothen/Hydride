import xml.etree.ElementTree as ET
from manual_parser import get_spec_from_xml
import sema_ast
import sys
import x86_to_rosette2
from vprint import vprint, vvprint

data_f = "data-latest.xml"
#num_threads = int(num_threads)
data_root = ET.parse(data_f)

num_parsed = 0
num_skipped = 0
supported_insts = set()
skipped_insts = set()

num_ok = 0
num_interpreted = 0

skipped = False
skip_to = '_mm512_popcnt_epi16'
skip_to = None


def get_verified_spec(intrin):
    try:
        spec = get_spec_from_xml(intrin)
        return True, spec
    except:
        return False, spec


debug = '_mm_sad_epu8'
debug = None

from collections import defaultdict

categories = defaultdict(int)

intrins = []
for intrin in data_root.iter('intrinsic'):
    cpuid = intrin.find('CPUID')
    sema = intrin.find('operation')
    inst = intrin.find('instruction')
    inst_form = None
    if inst is None:
        categories['NO-INST'] += 1
        continue

    if debug and intrin.attrib['name'] != debug:
        continue

    inst_form = inst.attrib['name'], inst.attrib.get('form')
    cpuid_text = 'Unknown'
    if cpuid is not None:
        if cpuid.text in ('MMX', 'AES', 'SHA', 'MPX', 'KNCNI', 'AVX512_4FMAPS',
                          'AVX512_BF16', 'INVPCID', 'RTM', 'XSAVE', 'FSGSBASE',
                          'RDRAND', 'RDSEED'):
            categories[cpuid.text] += 1
            continue
        cpuid_text = cpuid.text

    if (intrin.attrib['name'].endswith('getcsr')
            or intrin.attrib['name'].endswith('setcsr')
            or '_cmp_' in intrin.attrib['name']
            or 'zeroall' in intrin.attrib['name']
            or 'zeroupper' in intrin.attrib['name']
            or intrin.attrib['name'] == '_mm_sha1rnds4_epu32'
            or 'mant' in intrin.attrib['name']
            or 'ord' in intrin.attrib['name']
            or '4dpwss' in intrin.attrib['name']
            or 'ternarylogic' in intrin.attrib['name'] or
            #'cvt' in intrin.attrib['name'] or
            intrin.attrib['name'].startswith('_bit')
            or intrin.attrib['name'] in ('_rdpmc', '_rdtsc')
            or 'lzcnt' in intrin.attrib['name']
            or 'popcnt' in intrin.attrib['name']):
        if 'mask' in intrin.attrib['name']:
            categories['mask'] += 1
        else:
            categories['zero/fp-manip'] += 1
        continue
    cat = intrin.find('category')
    if cat is not None and cat.text in ('Elementary Math Functions',
                                        'General Support', 'Load', 'Store'):
        categories[cat.text] += 1
        continue
    if skip_to is not None and not skipped:
        if intrin.attrib['name'] != skip_to:
            continue
        else:
            skipped = True
    if sema is not None and (
            'MEM' in sema.text or 'FP16' in sema.text or 'Float16' in sema.text
            or 'MOD2' in sema.text or 'affine_inverse_byte' in sema.text
            or 'ShiftRows' in sema.text or 'MANTISSA' in sema.text
            or 'ConvertExpFP' in sema.text or '<<<' in sema.text
            or ' MXCSR ' in sema.text or 'ZF' in sema.text or 'CF' in sema.text
            or 'NaN' in sema.text or 'CheckFPClass' in sema.text
            or 'ROUND' in sema.text or 'carry_out' in sema.text
            or 'SignBit' in sema.text or 'SSP' in sema.text):
        categories['MISC'] += 1
        continue
    if 'str' in intrin.attrib['name']:
        if inst is not None:
            skipped_insts.add(inst_form)
        num_skipped += 1
        categories['STR'] += 1
        continue

    if 'fixup' in intrin.attrib['name']:
        if inst is not None:
            skipped_insts.add(inst_form)
        categories['fp-manip'] += 1
        num_skipped += 1
        continue
    if 'round' in intrin.attrib['name']:
        if inst is not None:
            skipped_insts.add(inst_form)
        categories['fp-manip'] += 1
        num_skipped += 1
        continue
    if 'prefetch' in intrin.attrib['name']:
        if inst is not None:
            skipped_insts.add(inst_form)
        num_skipped += 1
        categories['PREFETCH'] += 1
        continue

    if inst is not None and sema is not None:
        #if 'ELSE IF' in sema.text:
        #  continue
        intrins.append(intrin)

#from pprint import pprint
#pprint(categories)
#print('Total filtered:', sum(categories.values()))

vprint("intrins:")
#print(intrins)

for intrin in intrins:
    ok, spec = get_verified_spec(intrin)
    assert (ok == True)
    #    print(spec.intrin)
    #    print(spec.spec)
    vprint("intrin -> \n{}\n".format(spec.intrin))

    vvprint("intrin -> \n{}\n".format(spec.intrin))
    vvprint("inst -> \n{}\n".format(spec.inst))
    vvprint("params -> \n{}\n".format(spec.params))
    vvprint("spec -> \n{}\n".format(spec.spec))
    vvprint("rettype -> \n{}\n".format(spec.rettype))
    vvprint("binary_exprs -> \n{}\n".format(spec.binary_exprs))
    vvprint("inst_form -> \n{}\n".format(spec.inst_form))
    vvprint("cpuids -> \n{}\n".format(spec.cpuids))
    vvprint("imm_width -> \n{}\n".format(spec.imm_width))
    vvprint("xed -> \n{}\n".format(spec.xed))
    vvprint("elem_type -> \n{}\n".format(spec.elem_type))
    vvprint("configs -> \n{}\n".format(spec.configs))
    vvprint("TEST -> \n{}\n".format(
        sema_ast.FuncDef(spec.intrin, spec.params, spec.spec)))

    cvt = x86_to_rosette2.x86_CVT(spec)
    print(cvt.cvt_all())
vprint("PARSING DONE")

#pool = Pool(1 if debug else num_threads)
#num_intrins = 0
#for ok, compiled, spec in pool.imap_unordered(get_verified_spec, intrins):

#pool.terminate()
