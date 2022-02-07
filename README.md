# bufferover
bufferover is a DNS data extractor for penetration testers.

# Screenshots
![bufferover image](https://c.top4top.io/p_1714c2q1i1.png)

# Installation
- Install [jq](https://github.com/stedolan/jq) utilty.
- `git clone https://github.com/ahmedcj/bufferover.git`
- To use the script as part of your linux system:
```
cp bufferover.sh /usr/bin/bufferover
```

# Usage
- To get a list of all options:
```
./bufferover.sh
```
Option        | Description
------------- |-------------
-d            | Domains Extraction
-h            | Hosts Extraction
-s            | Subdomains Extraction
-sh           | Subdomains Hosts Extraction
-o            | Outfileing Data
## Examples
- To extract domains:
```
./bufferover.sh github.com -d
```
![domains](https://b.top4top.io/p_17147f0nf1.png)
- To extract hosts:
```
./bufferover.sh github.com -h
```
![hosts](https://c.top4top.io/p_1714tqomq2.png)
- To extract subdomains:
```
./bufferover.sh github.com -s
```
![subdomains](https://d.top4top.io/p_17141rakv3.png)
- To extract subdomains hosts:
```
./bufferover.sh github.com -sh
```
![subdomains hosts](https://e.top4top.io/p_1714w8n724.png)
- To oufileing data:
```
./bufferover.sh github.com -d -o file.txt
```

v1.1
