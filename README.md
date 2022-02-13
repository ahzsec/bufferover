# bufferover • ![Version](https://img.shields.io/badge/version-1.1-blue)
A DNS data extractor for penetration testers

# Installation
- Install [jq](https://github.com/stedolan/jq) utility
- git clone github.com/ahzsec/bufferover.git
- `cp bufferover.sh /usr/bin/bufferover`

![bufferover](https://g.top4top.io/p_1868o1map1.png)

# Usage
Option        | Description
------------- |-------------
-d            | Domains Extraction
-h            | Hosts Extraction
-s            | Subdomains Extraction
-sh           | Subdomains Hosts Extraction
-o            | Outfiling Data

## Examples

- Domains extraction:
```
bufferover github.com -d
```
![domains](https://b.top4top.io/p_17147f0nf1.png)

- Hosts extraction:
```
bufferover github.com -h
```
![hosts](https://c.top4top.io/p_1714tqomq2.png)

- Subdomains extraction:
```
bufferover github.com -s
```
![subdomains](https://d.top4top.io/p_17141rakv3.png)

- Subdomains hosts extraction:
```
bufferover github.com -sh
```
![subdomains hosts](https://e.top4top.io/p_1714w8n724.png)

- Data Outfiling:
```
bufferover github.com -d -o file.txt
```

# License
[![License](https://img.shields.io/badge/License-MIT-blue)](https://github.com/ahzsec/bufferover/blob/main/LICENSE.md)