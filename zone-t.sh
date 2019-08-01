#!/bin/bash

#colours

green="\e[92m"
red="\e[91m"
blue="\e[34m"
none="\e[0m"

#argument check

if [ ${#} -ne 1 ]; then
        echo -e "Need one domain to run the script ${blue}[USAGE]:${none} ${0} naked-domain"
        exit
fi

#working area
dig ns ${1} +short > ns.txt

while read line
do
        zone=$(dig  @${line} ${1}. axfr)
        if echo "$zone" | grep -Ei ("Transfer failed\."|"failed"|"network unreachable") &>/dev/null ; then
        echo -e "${red}zone Transfer ${none}${blue}[Failed]${none}${red} in ${line} Server${none}"
        else
        echo -e "${green}zone Transfer ${none}${blue}[SUCCESS]${none}${green} in ${line} Server${none}"
        dig  @${line} ${1}. axfr >> zonetranfer_results.md
        echo "DNS Retervied Data is saved in the file zonetranfer_results.md"
        fi
done < ns.txt
rm ns.txt
