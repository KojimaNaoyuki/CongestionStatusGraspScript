#!/bin/sh

echo -n Input place name:

read placeName

read area < ./data/placeAreaValue.txt

curl -X POST "http://localhost:3001/v1/places" -d "name=${placeName}&area=${area}"