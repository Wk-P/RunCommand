#! /bin/bash

while true; do
    nodes=$(sudo docker node ls --format '{{json .}}')
    for node in $nodes
    do 
        id=$(echo "$node" | jq -r '.ID')
        status=$(echo "$node" | jq -r '.Status')
        if [ "$status" == "Down" ]
        then
            sudo docker node rm "$id"
        fi
    done
done

