#!/bin/bash

header(){ printf "\e[36m
██████╗░██╗░░░██╗███████╗███████╗███████╗██████╗░░█████╗░██╗░░░██╗███████╗██████╗░
██╔══██╗██║░░░██║██╔════╝██╔════╝██╔════╝██╔══██╗██╔══██╗██║░░░██║██╔════╝██╔══██╗
██████╦╝██║░░░██║█████╗░░█████╗░░█████╗░░██████╔╝██║░░██║╚██╗░██╔╝█████╗░░██████╔╝
██╔══██╗██║░░░██║██╔══╝░░██╔══╝░░██╔══╝░░██╔══██╗██║░░██║░╚████╔╝░██╔══╝░░██╔══██╗
██████╦╝╚██████╔╝██║░░░░░██║░░░░░███████╗██║░░██║╚█████╔╝░░╚██╔╝░░███████╗██║░░██║
╚═════╝░░╚═════╝░╚═╝░░░░░╚═╝░░░░░╚══════╝╚═╝░░╚═╝░╚════╝░░░░╚═╝░░░╚══════╝╚═╝░░╚═╝\n\e[1mtwitter: @0x0Cj\e[0m\e[0m\n\n"
printf "Usage: ./bufferover.sh DOMAIN [OPTIONS] [-o output_file]\n\nOptions:\n\n	-d	Domains Extraction\n 	-h	Hosts Extraction\n	-s	Subdomains Extraction\n	-o	Outfile Data\n\n"
}

bufferover(){
OUTPUT=$(curl -s https://tls.bufferover.run/dns?q=${1} | jq '.Results')
if [[ "${OUTPUT}" = "null" ]]
then
	echo "${0}: error: please provide a valid domain." >&2
	exit 1
else
	if [[ "${2}" = "-d" ]]
	then
		LIST=$(echo "$OUTPUT" | jq '.[]' | awk -F ',' '{print $3}' | sed 's/"//' | sort -u)
		if [[ "${3}" = "-o" ]]; then if [[ -z "${4}" ]]; then 	echo "${0}: error: please provide an output filename." >&2
		exit 1 ; else echo "$LIST" > "${4}"; fi; else echo "$LIST"; fi
	elif [[ "${2}" = "-h" ]]
	then
		LIST=$(echo "$OUTPUT" | jq '.[]' |  awk -F ',' '{print $1}' | sed 's/"//' | sort -nu)
		if [[ "${3}" = "-o" ]]; then if [[ -z "${4}" ]]; then 	echo "${0}: error: please provide an output filename." >&2
		exit 1 ; else echo "$LIST" > "${4}"; fi; else echo "$LIST"; fi
	elif [[ "${2}" = "-s" ]]
	then
		LIST=$(echo "$OUTPUT" | jq '.[]' | awk -F ',' '{print $3}' | sed 's/"//' | sort -u | grep "\.${1}$")
		if [[ "${3}" = "-o" ]]; then if [[ -z "${4}" ]]; then 	echo "${0}: error: please provide an output filename." >&2
		exit 1 ; else echo "$LIST" > "${4}"; fi; else echo "$LIST"; fi
	else
		header
	fi
fi
}

case ${2} in
	-d|-h|-s) bufferover $1 $2 $3 $4;;
	*) if [[ -z "${2}" ]]; then header; else echo "${0}: error: unknown option: \"${2}\"" >&2; exit 1; fi  ;;
esac
