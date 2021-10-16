

import re


def find_between(s, first, last):
  find_bw_array = list()
  # Split the string 
  s_array = s.split(first)
  print("s_array:")
  print(s_array)
  print(len(s_array))
  for string in s_array:
    string = first + string
    print("string:")
    print(string)
    if string not in s:
      continue
    start = string.index(first) + len(first)
    print("start:")
    print(start)
    try:
      end = string.index(last, start)
    except ValueError:
      continue
    print("end:")
    print(end)
    ret = string[start:end]
    print("ret:")
    print(ret)
    if ret == '':
      continue
    if ret not in find_bw_array:
      find_bw_array.append(ret)
  return find_bw_array


ext_utility_funcs = [
  "ext-bv", "sign-ext-bv", "zero-ext-bv", 
  "low-ext-bv", "sign-low-ext-bv", "zero-low-ext-bv"
]


def list_to_string(lst):
  string = "\""
  for index, item in enumerate(lst):
    string += item
    if index != len(lst) - 1:
      string += ","
  string += "\""
  return string


def strip_brackets(s):
  return re.sub(r"[\([{})\]]", "", s)