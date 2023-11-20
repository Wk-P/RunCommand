#! /bin/bash

while true
do
    NODES_ID=$(sudo docker node ls --format '{{ .ID}}')
    for node_id in $NODES_ID
    do
        labels="$(sudo docker node inspect --format '{{ json .Spec.Labels}}' $node_id)"
        role="$(sudo docker node inspect --format '{{json .Spec.Role}})' $node_id)"
        if [ "$labels" == '{}' ] && [ "$role" == "worker" ]
        then
            sudo docker node update --label-add 'node=worker' "$node_id"
        # else
            # echo node id is $node_id
        fi
    done
done