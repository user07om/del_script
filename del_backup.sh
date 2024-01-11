#!/bin/bash
#Auther: Omkar Bulbule

# Variable declaration
DELDATE=$(date --date="-10 days" +'%Y-%m-%d')
LOGPATH="/opt/script/logs/del_log.txt"

{
    echo -e "\n--------------------------------"
    date 
    echo 
} >> "$LOGPATH"


list_it=$(ls -latr | awk '{print $9}')

for i in $list_it; do
    REFDATE=$(stat -c %y "$i" | awk '{print $1}')
    if [ "$DELDATE" == "$REFDATE" ]; then
        du -sh "$i" >> "$LOGPATH"
        # rm -rf "$i"
    fi
done

{
    echo -e "\n--------------------------------\n"
}  >> "$LOGPATH"

