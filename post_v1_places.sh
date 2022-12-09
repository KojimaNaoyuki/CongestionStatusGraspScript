#!/bin/sh
read area < ./data/placeAreaValue.txt

curl -X POST "http://localhost:3001/v1/places" -d "name=$1&area=${area}" | jq '.data.id' > /opt/CongestionStatusGraspScript/data/placeId.txt
