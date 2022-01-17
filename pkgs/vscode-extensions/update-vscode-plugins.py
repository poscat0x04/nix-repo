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
import xml.etree.ElementTree as ET

def getLatestPylsVersion():
    url = 'https://pvsc.blob.core.windows.net/python-language-server-stable?restype=container&comp=list&prefix=Python-Language-Server-linux-x64'
    r = get(url)
    xml = ET.fromstring(r.text)
    p = re.compile(r'^Python-Language-Server-linux-x64\.(?P<version>.*)\.nupkg$')
    def getVersion(e):
        m = p.match(e.text)
        return m.group('version')
    versions = [getVersion(x) for x in xml.findall(".//Blob/Name")]
    versions.sort(key=cmp_to_key(version_compare), reverse=True)
    return versions[0]

def getLatestPyls():
    version = getLatestPylsVersion()
    url = f'https://pvsc.azureedge.net/python-language-server-stable/Python-Language-Server-linux-x64.{version}.nupkg'
    sha256 = prefetchUrl(url)
    return version, url, sha256

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
    version, url, sha256 = getLatestPyls()
    with open('rust-analyzer/rust-analyzer.json', 'w+') as src:
        json.dump(getExtension(name='rust-analyzer', publisher='matklad'), src, indent=4, sort_keys=True)
    with open('python/pyls.json', 'w+') as pyls:
        json.dump({'version': version, 'url': url, 'sha256': sha256}, pyls, indent=4, sort_keys=True)
    with open('python/vscode-python.json', 'w+') as vsc:
        json.dump(getExtension(name='python', publisher='ms-python'), vsc, indent=4, sort_keys=True)
    with open('extensions.yaml') as f:
        exts = load(f.read(), Loader=Loader)
        result = [getExtension(name=ext['name'], publisher=ext['publisher']) for ext in exts]
        with open('extensions.json', 'w+') as target:
            json.dump(result, target, indent=4, sort_keys=True)


if __name__ == '__main__':
    main()
