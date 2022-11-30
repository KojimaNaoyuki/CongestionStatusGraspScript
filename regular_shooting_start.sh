#!/bin/sh

# 計測を開始する
curl -X PUT "http://localhost:3001/v1/congestion_data" -d "place_id=$1"