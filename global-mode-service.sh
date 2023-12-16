#! /bin/bash

SERVICE_NAME="node-service"
IMAGE="soar009/node-service-image:v5"
REPLICAS=$(sudo docker node ls --filter "role=worker" | grep -c "Ready")
CONSTRAINT="node.labels.node==worker"
CPU_LIMIT=0.5
MODE="global"

# sudo docker service create --name "$SERVICE_NAME" -p 8080:8080 --replicas $REPLICAS --limit-cpu $CPU_LIMIT --constraint "$CONSTRAINT" "$IMAGE"
sudo docker service create --name "$SERVICE_NAME" -p 8080:8080 --limit-cpu $CPU_LIMIT --mode "$MODE" --constraint "$CONSTRAINT" "$IMAGE"

# sudo docker node ls --filter "role=worker" -q | sudo wc -l