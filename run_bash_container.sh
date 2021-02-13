#!/bin/bash

echo "Runing bash inside container..."
CONTAINER_ID=$(docker ps | awk ' /ibmcom/ { print $1 }')
#echo $CONTAINER_ID
docker exec -ti $CONTAINER_ID /bin/bash

