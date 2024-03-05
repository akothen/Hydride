import os
import requests
from bs4 import BeautifulSoup
from urllib.parse import urlparse

# only 32 bit integer vector instructions for now

# TODO: 
# - 16 bit integer ops
# - MAC intrinsics

def download_html(url, filename=None):
    try:
        response = requests.get(url)
        if response.status_code == 200:
            soup = BeautifulSoup(response.content, 'html.parser')
            if not filename:
                parsed_url = urlparse(url)
                path = parsed_url.path
                filename = os.path.basename(path)
                filename_without_extension, file_extension = os.path.splitext(filename)
                filename = f"{filename_without_extension}_page.html"
            with open(filename, 'w', encoding='utf-8') as file:
                file.write(str(soup))

            print(f"HTML content downloaded successfully and saved to '{filename}'")
        else:
            print(f"Failed to download HTML. Status code: {response.status_code}")

    except Exception as e:
        print(f"An error occurred: {e}")

with open('links.txt', 'r', encoding='utf-8') as links_file:
    for link in links_file:
        download_html(link)
