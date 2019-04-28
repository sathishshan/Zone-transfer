#!/bin/bash

if [ $# -ne 1 ]; then
        echo -e "Need one domain to run the script \e[92m[USAGE]:\e[0m $0 naked-domain"
        exit
fi

dig ns $1 +short > ns.txt

while read line
do
        zone=$(dig  @${line} $1 axfr)
        if echo "$zone" | grep -i "Transfer failed." &>/dev/null ; then
        echo -e "\e[91mzone Transfer\e[0m \e[34m[Failed]\e[0m\e[91m in ${line} Server\e[0m"
        else
        echo -e "\e[92mzone Transfer\e[0m \e[34m[SUCCESS]\e[0m\e[92m in ${line} Server\e[0m"
        dig  @${line} $1 axfr >> zonetranfer_results.md
        echo "DNS Retervied Data is saved in the file zonetranfer_results.md"
        fi
done < ns.txt
rm ns.txt
