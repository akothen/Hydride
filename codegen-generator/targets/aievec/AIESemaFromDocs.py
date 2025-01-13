import os
import requests
from bs4 import BeautifulSoup
import urllib
import os
import glob
from AIEMeta import *
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

print(len(ParseAddSubHTML()))