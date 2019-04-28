#!/bin/bash

#argument check

if [ $# -ne 1 ]; then
        echo -e "Need one domain to run the script${green}[USAGE]:${none} $0 naked-domain"
        exit
fi

#colours

green="\e[92m"
red="\e[91m"
violet="\e[34m"
none="\e[0m"

#working area
dig ns ${1} +short > ns.txt

while read line
do
        zone=$(dig  @${line} ${1}. axfr)
        if echo "$zone" | grep -i "Transfer failed." &>/dev/null ; then
        echo -e "${red}zone Transfer${none}${violet}[Failed]${none}${red} in ${line} Server${none}"
        else
        echo -e "${green}zone Transfer${none}${violet}[SUCCESS]${none}${green} in ${line} Server${none}"
        dig  @${line} ${1}. axfr >> zonetranfer_results.md
        echo "DNS Retervied Data is saved in the file zonetranfer_results.md"
        fi
done < ns.txt
rm ns.txt
