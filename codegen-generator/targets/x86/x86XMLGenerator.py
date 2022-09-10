import xml.etree.ElementTree as ET
from collections import defaultdict



def GenRelevantXML(FileName):
  DataRoot = ET.parse(FileName)
  NumSkipped = 0
  SkippedInsts = set()
  Skipped = False
  #SkipTo = '_mm512_popcnt_epi16'
  SkipTo = None
  #debug = '_mm_sad_epu8'
  debug = None
  Categories = defaultdict(int)

  InstructionList = []
  for intrin in DataRoot.iter('intrinsic'):
    cpuid = intrin.find('CPUID')
    operation = intrin.find('operation') 
    inst = intrin.find('instruction')
    inst_form = None
    if inst is None:
      Categories['NO-INST'] += 1
      NumSkipped += 1
      continue

    inst_form = inst.attrib['name'], inst.attrib.get('form')
    if cpuid is not None:
      if cpuid.text in ('AES', 'SHA', 'MPX', 
          'AVX512_4FMAPS', 'AVX512_BF16',
          'INVPCID', 'XSAVE', 'FSGSBASE', 'GFNI'):
        Categories[cpuid.text] += 1
        NumSkipped += 1
        continue

    if (intrin.attrib['name'].endswith('getcsr') or
        intrin.attrib['name'].endswith('setcsr') or
        'setzero' in intrin.attrib['name'] or
        'pos' in intrin.attrib['name'] or
        'conflict' in intrin.attrib['name'] or
        'expand' in intrin.attrib['name'] or
        'compress' in intrin.attrib['name'] or
        '_cmp_' in intrin.attrib['name'] or
        'zeroall' in intrin.attrib['name'] or
        'zeroupper' in intrin.attrib['name'] or
        intrin.attrib['name'] == '_mm_sha1rnds4_epu32' or
        'mant' in intrin.attrib['name'] or
        'ord' in intrin.attrib['name'] or
        '4dpwss' in intrin.attrib['name'] or
        #'ternarylogic' in intrin.attrib['name'] or
        #'cvt' in intrin.attrib['name'] or
        intrin.attrib['name'].startswith('_bit') or
        intrin.attrib['name'] in ('_rdpmc', '_rdtsc') or
        'lzcnt' in intrin.attrib['name'] or
        'popcnt' in intrin.attrib['name']):
      if 'mask' in intrin.attrib['name']:
        Categories['mask'] += 1
      else:
        Categories['zero/fp-manip'] += 1
      NumSkipped += 1
      continue
    cat = intrin.find('category')
    if cat is not None and cat.text in (
        'Elementary Math Functions', 
        'General Support', 
        'Load', 'Store',
        'Bit Manipulation',
        'Application-Targeted'):
      NumSkipped += 1
      Categories[cat.text] += 1
      continue
    types = intrin.findall('type')
    if types is not None:
      print("CHECK")
      FloatFound = True
      for type in types:
        if "Integer" in type.text:
          FloatFound = False
      if FloatFound == True:
        NumSkipped += 1
        continue
    if SkipTo is not None and not Skipped:
      if intrin.attrib['name'] != SkipTo:
        NumSkipped += 1
        continue
      else:
        Skipped = True
    if operation is not None and (
        'MEM' in operation.text or
        'FP16' in operation.text or
        'Float16' in operation.text or
        'MOD2' in operation.text or
        'affine_inverse_byte' in operation.text or
        'ShiftRows' in operation.text or
        'MANTISSA' in operation.text or
        'ConvertExpFP' in operation.text or
        '<<<' in operation.text or
        ' MXCSR ' in operation.text or
        'ZF' in operation.text or
        'CF' in operation.text or
        'NaN' in operation.text or 
        'CheckFPClass' in operation.text or
        'ROUND' in operation.text or
        'carry_out' in operation.text or
        'SignBit' in operation.text or
        'SSP' in operation.text or
        'Convert' in operation.text or 
        'CASE' in operation.text or
        'WHILE' in operation.text or
        'Carry' in operation.text or
        'parity' in operation.text or
        'Borrow' in operation.text or
        'k_old' in operation.text or
        'sign' in operation.text or
        'DO WHILE' in operation.text):
      Categories['MISC'] += 1
      NumSkipped += 1
      continue
    if 'str' in intrin.attrib['name']:
      if inst is not None:
        SkippedInsts.add(inst_form)
      NumSkipped += 1
      Categories['STR'] += 1
      continue

    if 'fixup' in intrin.attrib['name']:
      if inst is not None:
        SkippedInsts.add(inst_form)
      Categories['fp-manip'] += 1
      NumSkipped += 1
      continue
    if 'round' in intrin.attrib['name']:
      if inst is not None:
        SkippedInsts.add(inst_form)
      Categories['fp-manip'] += 1
      NumSkipped += 1
      continue
    if 'prefetch' in intrin.attrib['name']:
      if inst is not None:
        SkippedInsts.add(inst_form)
      NumSkipped += 1
      Categories['PREFETCH'] += 1
      continue

    if "AVX512_VBMI2" == cpuid.text:
      NumSkipped += 1
      continue

    #if "alignr" in intrin.attrib['name'] or \
    #  "donflict" in intrin.attrib['name']:
    #  NumSkipped += 1
    #  continue

    #if #inst is not None and 
    if operation is not None:
      InstructionList.append(intrin)

  # Parse every instruction
  print("NUM SKIPPED INSTRUCTIONS:")
  print(NumSkipped)
  String = "<intrinsics_list>\n"
  for Instruction in InstructionList:
    #print(lxml.etree.tostring(Instruction, pretty_print=True))
    String += ET.tostring(Instruction, encoding='unicode')
  String += "</intrinsics_list>\n"
  File = open("new.xml", "w")
  File.write(String)
  File.close()



if __name__ == '__main__':
  GenRelevantXML("hydride.x86.xml")


