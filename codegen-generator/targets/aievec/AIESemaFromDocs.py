import os
import requests
from bs4 import BeautifulSoup
import urllib
import os
import glob
from AIEMeta import *
import re
# only 32 bit integer vector instructions for now

root_url = "https://www.xilinx.com/htmldocs/xilinx2023_2/aiengine_ml_intrinsics/intrinsics/"
r = requests.get(root_url + "group__intr__gpvectorop.html") 
soup = BeautifulSoup(r.text, 'html.parser') 
anchors = soup.find_all('a', {'class': 'el', 'href': True})
f = open("links.txt", "w")
if not os.path.exists("./intrinsics/"):
    os.makedirs("./intrinsics/")

for link in anchors: 
    final_link = root_url + link.get('href')
    #print(f"Writing {final_link} to links.txt")
    file_path = "./intrinsics/" + link.get('href')
    if not os.path.exists(file_path):    
        urllib.request.urlretrieve(final_link, file_path)
f.close()

def NameGen(name, type):
    return f"{type}_{name}"        

def ParseAddSubHTML() -> list[AIESema]:
    f = open("./intrinsics/group__intr__gpvectorop__add.html", "r")
    soup = BeautifulSoup(f.read(), 'html.parser')
    header_elements = soup.find_all('table', attrs={'class':'memname'})
    tmp = []
    for element in header_elements:
        type_and_name = element.find('td', attrs={'class':'memname'})
        type_and_name_split = type_and_name.text.split()
        rettype = type_and_name_split[0]
        raw_name = type_and_name_split[1]
        conf = "conf" in raw_name
        if "operator" in raw_name:
            continue
        if "cacc" in rettype or "cint" in rettype or "float" in rettype:
            continue
        instclass = ""
        if raw_name == "add":
            instclass = "ADD"
        if raw_name == "addsub":
            instclass = "ADDSUB"
        elif raw_name == "sub":
            instclass = "SUB"
        elif raw_name == "neg":
            instclass = "NEG"
        elif raw_name == "neg_gtz":
            instclass = "NEGGTZ"
        elif raw_name == "neggadd":
            instclass = "NEGADD"
        elif raw_name == "add_conf":
            instclass = "ADD_CONF"
        elif raw_name == "neg_conf":
            instclass = "NEG_CONF"
        elif raw_name == "sub_conf":
            instclass = "SUB_CONF"
        elif raw_name == "negadd_conf":
            instclass = "NEGADD_CONF"
        elif "clr" in raw_name:
            instclass = "CLR"

        param_types = element.find_all('td', attrs={'class':'paramtype'})
        param_names = element.find_all('td', attrs={'class':'paramname'})
        params = []
        if len(param_names) != len(param_types):
            continue
        for ty, tn in zip(param_types, param_names):
            #params.append(f"{ty.text} {tn.text}".replace(u'\xa0', u' '))
            ty_str = ty.text.replace(u'\xa0', u' ').strip().replace(" ", "").replace(",", "")
            tn_str = tn.text.replace(u'\xa0', u' ').strip().replace(" ", "").replace(",", "")
            params.append(Parameter(tn_str, ty_str, "u" not in ty_str))

        name = NameGen(type_and_name_split[0], type_and_name_split[1])

        sema = AIESema(
            intrin=name,
            params=params,
            instclass=instclass,
            conf=conf,
            rettype=rettype,
            )

        tmp.append(sema)
    f.close()
    return tmp

def ParseMulHTML() -> list[AIESema]:
    f = open("./intrinsics/group__intr__gpvectorop__mul.html", "r")
    soup = BeautifulSoup(f.read(), 'html.parser')
    link_elements = soup.find_all('td', attrs={'class':'memItemRight'})
    links = []
    tmp = []
    print(f"Links: {link_elements}")
    for entry in link_elements:
        link = entry.find('a')['href']
        name = entry.find('a').text.lower()
        unsupported = ["emulated", "complex", "sparse", "bfloat16", "fp32"]
        if any(tag in name for tag in unsupported):
            continue
        root_url = "https://www.xilinx.com/htmldocs/xilinx2023_2/aiengine_ml_intrinsics/intrinsics/"
        r = requests.get(root_url + link) 
        inner_soup = BeautifulSoup(r.text, 'html.parser') 
        header_elements = inner_soup.find_all('table', attrs={'class':'memname'})
        print("Processing: ", name)
        for element in header_elements:
            type_and_name = element.find('td', attrs={'class':'memname'})
            type_and_name_split = type_and_name.text.split()
            rettype = type_and_name_split[0]
            raw_name = type_and_name_split[1]
            conf = "conf" in raw_name
            mac_mm_pattern = r"mac_\d+x(\d+)_\1x\d+(_conf)?$"
            mm_pattern = r"mul_\d+x(\d+)_\1x\d+(_conf)?$"
            neg_mm_pattern = r"negmul_\d+x(\d+)_\1x\d+(_conf)?$"
            if "operator" in raw_name:
                continue
            if "cacc" in rettype or "cint" in rettype or "float" in rettype:
                continue
            if "negmul_elem_" in raw_name:
                instclass = "NEGELTMUL"
            elif "mul_elem_" in raw_name:
                instclass = "ELTMUL"
            elif "mac_elem_" in raw_name:
                instclass = "ELTMAC"
            elif "addmac" in raw_name:
                instclass = "ADDMAC"
            elif "submsc" in raw_name:
                instclass = "SUBMSC"
            elif "negmac" in raw_name:
                instclass = "NEGMAC"
            elif "submac" in raw_name:
                instclass = "SUBMAC"
            elif re.fullmatch(mm_pattern, raw_name):
                instclass = "MATMUL"
            elif re.fullmatch(neg_mm_pattern, raw_name):
                instclass = "NEGMATMUL"
            elif re.fullmatch(mac_mm_pattern, raw_name):
                instclass = "MACMATMUL"
            else:
                instclass = "NONE"
            param_types = element.find_all('td', attrs={'class':'paramtype'})
            param_names = element.find_all('td', attrs={'class':'paramname'})
            params = []
            if len(param_names) != len(param_types):
                continue
            for ty, tn in zip(param_types, param_names):
                #params.append(f"{ty.text} {tn.text}".replace(u'\xa0', u' '))
                ty_str = ty.text.replace(u'\xa0', u' ').strip().replace(" ", "").replace(",", "")
                if "sparse" in ty_str:
                    break
                tn_str = tn.text.replace(u'\xa0', u' ').strip().replace(" ", "").replace(",", "")
                params.append(Parameter(tn_str, ty_str, "u" not in ty_str))

            name = NameGen(type_and_name_split[0], type_and_name_split[1])
            sema = AIESema(
            intrin=name,
            params=params,
            instclass=instclass,
            conf=conf,
            rettype=rettype,
            )

            tmp.append(sema)
            #print(sema)
            #print("\n")
    print("\n\n\n")
    f.close()
    return tmp

#print(len(ParseAddSubHTML()))
#ParseMulHTML()