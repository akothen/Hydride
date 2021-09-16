


def find_between(s, first, last, throw_none=False):
  try:
    start = s.index(first) + len(first)
    end = s.index(last, start)
    return s[start:end]
  except ValueError:
    if throw_none == True:
      return None
    return ""


def gen_rosette_func(dsl_file, sketch_file, sketch_func_name):
  f = open(sketch_file, "r")
  sketch_func_sig_lines = list()
  dsl_func_body = list()
  sym_list = list()
  sig_end = False
  last_sig_line = ""
  for line in f:
    if ";" in line:
      continue
    if sketch_func_name in line:
      print(sketch_func_name)
      sketch_func_sig_lines.append(line)
      if ")" in line:
        sig_end = True
        sketch_func_sig_lines.append(line)
        last_sig_line = line
        print("last_sig_line:")
        print(line)
      continue
    if sig_end == False and ")" in line:
      sig_end = True
      sketch_func_sig_lines.append(line)
      last_sig_line = line
      print("last_sig_line:")
      print(line)
      continue
    if sig_end == False:
      sketch_func_sig_lines.append(line)
      continue
    if "define-symbolic" in line:
      line = line.strip()
      line = line.replace(" ", "")
      print("line:")
      print(line)
      str = find_between(line, "define-symbolic", "integer")
      print("sym: ")
      print(str)
      sym_list.append(str.strip())
      continue
    dsl_func_body.append(line)
  
  f = open(dsl_file, "a")
  for line in sketch_func_sig_lines:
    if line == last_sig_line:
      split_line = line.split(")")
      line = split_line[0]
      for sym in sym_list:
        line += ","
        line += sym
      line += (")" + split_line[1])
    f.write(line)
  for line in dsl_func_body:
    f.write(line)


    

      
