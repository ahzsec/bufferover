#!/bin/bash

#v1.1
#Made by Ahmed (Github: @ahmedcj)

header(){ printf "\e[36mv1.1 @ phalanx project
██████╗░██╗░░░██╗███████╗███████╗███████╗██████╗░░█████╗░██╗░░░██╗███████╗██████╗░
██╔══██╗██║░░░██║██╔════╝██╔════╝██╔════╝██╔══██╗██╔══██╗██║░░░██║██╔════╝██╔══██╗
██████╦╝██║░░░██║█████╗░░█████╗░░█████╗░░██████╔╝██║░░██║╚██╗░██╔╝█████╗░░██████╔╝
██╔══██╗██║░░░██║██╔══╝░░██╔══╝░░██╔══╝░░██╔══██╗██║░░██║░╚████╔╝░██╔══╝░░██╔══██╗
██████╦╝╚██████╔╝██║░░░░░██║░░░░░███████╗██║░░██║╚█████╔╝░░╚██╔╝░░███████╗██║░░██║
╚═════╝░░╚═════╝░╚═╝░░░░░╚═╝░░░░░╚══════╝╚═╝░░╚═╝░╚════╝░░░░╚═╝░░░╚══════╝╚═╝░░╚═╝\ntwitter: @0x0Cj\e[0m\n\n"
printf "Usage: $(basename $0) DOMAIN [OPTION] [-o output_file]\n\nOptions:\n\n	-d	Domains Extraction\n 	-h	Hosts Extraction\n	-s	Subdomains Extraction\n	-sh	Subdomains Hosts Extraction\n	-o	Outfileing Data\n\n"
}

bufferover(){
OUTPUT=$(curl -s https://tls.bufferover.run/dns?q=${1} | jq '.Results')
if [[ "${OUTPUT}" = "null" ]]
then
	echo "$(basename $0): error: please provide a valid domain." >&2
	exit 1
else
	if [[ "${2}" = "-d" ]]
	then
		LIST=$(echo "$OUTPUT" | jq '.[]' | awk -F ',' '{print $3}' | sed 's/"//' | sort -u)
		case ${3} in
			-o) output "${LIST}" $4 ;;
			 *) echo "$LIST" ;;
		esac 
	elif [[ "${2}" = "-h" ]]
	then
		LIST=$(echo "$OUTPUT" | jq '.[]' |  awk -F ',' '{print $1}' | sed 's/"//' | sort -nu)
		case ${3} in
			-o) output "${LIST}" $4 ;;
			 *) echo "$LIST" ;;
		esac
	elif [[ "${2}" = "-s" ]]
	then
		LIST=$(echo "$OUTPUT" | jq '.[]' | awk -F ',' '{print $3}' | sed 's/"//' | sort -u | grep "\.${1}$")
		case ${3} in
			-o) output "${LIST}" $4 ;;
			 *) echo "$LIST" ;;
		esac 
	elif [[ "${2}" = "-sh" ]]
	then
		LIST=$(echo "$OUTPUT" | jq '.[]' | sed 's/"//g' | grep "\.${1}$" | awk -F ',' '{print $1}' | sort -nu)
		case ${3} in
			-o) output "${LIST}" $4 ;;
			 *) echo "$LIST" ;;
		esac 
	else
		header
	fi
fi
}

output(){
if [[ -z "${2}" ]]
then
	echo "$(basename $0): error: please provide output filename." >&2
	exit 1
else
	echo "${1}" > "${2}"
fi
}

case ${2} in
	-d|-h|-s|-sh) bufferover $1 $2 $3 $4;;
	*) if [[ -z "${2}" ]]; then header; else echo "$(basename $0): error: unknown option: \"${2}\"" >&2; exit 1; fi  ;;
esac
