# bufferover • ![Version](https://img.shields.io/badge/version-1.1.5-blue)
A DNS data extractor for penetration testers

# Installation
- Install [jq](https://github.com/stedolan/jq) utility
- git clone github.com/ahzsec/bufferover.git
- `cp bufferover.sh /usr/bin/bufferover`

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
![domains](preview/domains-extraction.png)

- Subdomains extraction:
```
bufferover github.com -s
```
![subdomains](preview/subdomains-extraction.png)

- Subdomains hosts extraction:
```
bufferover github.com -sh
```
![subdomains hosts](preview/subdomains-hosts-extraction.png)

- Data Outfiling:
```
bufferover github.com -d -o file.txt
```

# License
[![License](https://img.shields.io/badge/License-MIT-blue)](https://github.com/ahzsec/bufferover/blob/main/LICENSE.md)