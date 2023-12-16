#! /bin/bash

while true
do
    NODES_ID=$(echo 123321 | sudo -S docker node ls --format '{{ .ID}}')
    for node_id in $NODES_ID
    do
        labels=$(echo 123321 | sudo -S docker node inspect --format '{{ json .Spec.Labels }}' "$node_id" | jq -e 'length == 0')
        role=$(echo 123321 | sudo -S docker node inspect --format '{{ json .Spec.Role }}' "$node_id" | jq -r .)

        if [ "$labels" == "true" ] && [ "$role" == "worker" ]
        then
            echo 123321 | sudo -S docker node update --label-add 'node=worker' "$node_id"
        fi
    done
    sleep 5
done
