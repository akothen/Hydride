import os
import requests
from bs4 import BeautifulSoup
import urllib
import os
import glob
# only 32 bit integer vector instructions for now

# TODO: 
# - 16 bit integer ops
# - MAC intrinsics

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

for filepath in glob.iglob('./intrinsics/*.html'):
    f = open(filepath, "r")
    soup = BeautifulSoup(f.read(), 'html.parser')
    header_elements = soup.find_all('table', attrs={'class':'memname'})
    for element in header_elements:
        print(element)
        type_and_name = element.find('td', attrs={'class':'memname'})
        type_and_name_split = type_and_name.text.split()
        param_types = element.find_all('td', attrs={'class':'paramtype'})
        param_names = element.find_all('td', attrs={'class':'paramname'})
        params = []
        if len(param_names) != len(param_types):
            continue
        for ty, tn in zip(param_types, param_names):
            params.append(f"{ty.text} {tn.text}".replace(u'\xa0', u' '))
        print(f"Processed Inst: {type_and_name_split[0]} {type_and_name_split[1]}({''.join(params)})")
        print("\n\n")
        
    f.close()