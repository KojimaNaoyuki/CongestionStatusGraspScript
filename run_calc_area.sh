#!/bin/sh

# 静止画撮影
curl -H "content-type: application/json; charset=utf-8" -X POST http://192.168.1.1:80/osc/commands/execute -d '{"name": "camera.takePicture"}'

sleep 5s

# 新規保存されたファイル名を取得
curl -H "content-type: application/json; charset=utf-8" -X POST http://192.168.1.1:80/osc/state | jq '.state._latestFileUrl' | tr -d \" | cut -f 5,6,7 -d "/" > /opt/CongestionStatusGraspScript/data/takePicturedFilePath.txt

read filePath < ./data/takePicturedFilePath.txt

# 画像ファイルを取得
curl -H "content-type: application/json; charset=utf-8" -X GET "http://192.168.1.1:80/files/${filePath}" > /opt/MeasureActualDistanceFrom360DegreeImage/360DegreeImg/img.jpg

# 面積計算プログラムを起動
python3 /opt/MeasureActualDistanceFrom360DegreeImage/run.py /opt/MeasureActualDistanceFrom360DegreeImage/360DegreeImg/img.jpg $1 $2
