#!/bin/bash.

log_file_name="api-log.txt"
apis=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
    "https://bad-api.com"
)

for api in "${apis[@]}"; do
    success_state="HTTP/2 200"
    res=$(curl -s -L --head --request GET "$api" | grep "$success_state")

    if [[ -n $res ]];
        then
            echo "$api is UP" >> $log_file_name 
        else
            echo "$api is DOWN" >> $log_file_name 
    fi
done



