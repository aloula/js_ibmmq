#!/bin/bash

echo "Stopping container..."
CONTAINER_ID=$(docker ps -aqf "name=^priceless_spence$")
#echo $CONTAINER_ID
docker stop $CONTAINER_ID
echo "Done!"

