#!/bin/sh

# 静止画撮影
curl -H "content-type: application/json; charset=utf-8" -X POST http://192.168.1.1:80/osc/commands/execute -d '{"name": "camera.takePicture"}'

while :
do
    sleep 5s
    echo 'ddd'
done