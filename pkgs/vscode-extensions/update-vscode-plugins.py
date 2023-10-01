#!/usr/bin/env python3

from packaging.version import Version, parse
from requests import post, get
from yaml import load, dump
from functools import cmp_to_key
from libversion import version_compare
try:
    from yaml import CLoader as Loader, CDumper as Dumper
except ImportError:
    from yaml import Loader, Dumper
import json
import re
import subprocess


def getLatestVersionInfo(publisher, name):
    url = 'https://marketplace.visualstudio.com/_apis/public/gallery/extensionquery'
    data = { 'assetTypes': None
           , 'filters': [
               { 'criteria': [{'filterType': 7, 'value': '{}.{}'.format(publisher,name)}]
               , 'direction': 2
               , 'pageSize': 100
               , 'pageNumber': 1
               , 'sortBy': 0
               , 'sortOrder': 0
               , 'pagingToken': None
               }
             ]
           , 'flags': 103
           }
    headers = { 'Content-type': 'application/json', 'Accept': 'application/json;api-version=6.1-preview.1;excludeUrls=true' }
    r = post(url, data=json.dumps(data), headers=headers)
    versions = r.json()['results'][0]['extensions'][0]['versions']
    latest_version = sorted(versions, key=lambda x: parse(x['version']), reverse=True)[0]
    ver = latest_version['version']
    #files = latest_version['files']
    #vsix = list(filter(lambda x: x['assetType'] == 'Microsoft.VisualStudio.Services.VSIXPackage', files))[0]
    #url = vsix['source']
    #return ver, url
    return ver

def prefetchUrl(url):
    args = ["nix-prefetch-url", url]
    o = subprocess.check_output(args).decode("utf-8")
    return o.strip()

def formatUrl(name, publisher, version):
    return f"https://{publisher}.gallery.vsassets.io/_apis/public/gallery/publisher/{publisher}/extension/{name}/{version}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"

def getExtension(name, publisher):
    ver = getLatestVersionInfo(publisher, name)
    url = formatUrl(name, publisher, ver)
    print(url)
    sha256 = prefetchUrl(url)
    return {'name': name, 'publisher': publisher, 'version': ver, 'sha256': sha256}

def main():
    with open('rust-analyzer/rust-analyzer.json', 'w+') as src:
        json.dump(getExtension(name='rust-analyzer', publisher='rust-lang'), src, indent=4, sort_keys=True)
    with open('python/vscode-python.json', 'w+') as vsc:
        json.dump(getExtension(name='python', publisher='ms-python'), vsc, indent=4, sort_keys=True)
    with open('extensions.yaml') as f:
        exts = load(f.read(), Loader=Loader)
        result = [getExtension(name=ext['name'], publisher=ext['publisher']) for ext in exts]
        with open('extensions.json', 'w+') as target:
            json.dump(result, target, indent=4, sort_keys=True)


if __name__ == '__main__':
    main()
