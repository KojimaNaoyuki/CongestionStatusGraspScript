#!/bin/sh

# 静止画撮影
curl -H "content-type: application/json; charset=utf-8" -X POST http://192.168.1.1:80/osc/commands/execute -d '{"name": "camera.takePicture"}'

sleep 5s

# 新規保存されたファイル名を取得
curl -H "content-type: application/json; charset=utf-8" -X POST http://192.168.1.1:80/osc/state | jq '.state._latestFileUrl' | tr -d \" | cut -f 5,6,7 -d "/" > /opt/CongestionStatusGraspScript/data/takePicturedFilePath.txt

read filePath < /opt/CongestionStatusGraspScript/data/takePicturedFilePath.txt

# 画像ファイルを取得
curl -H "content-type: application/json; charset=utf-8" -X GET "http://192.168.1.1:80/files/${filePath}" > /opt/RAPiD_improvement/images/img.jpg

# 画像全削除
curl -H "content-type: application/json; charset=utf-8" -X POST http://192.168.1.1:80/osc/commands/execute -d '{"name": "camera.delete", "parameters": {"fileUrls": ["image"]}}'

export DISPLAY=""

# 人数カウント
python3 /opt/RAPiD_improvement/example.py

read people < /opt/RAPiD_improvement/result/count.txt

export DISPLAY=192.168.159.1:0.0

read congestionDataId < /opt/CongestionStatusGraspScript/data/congestionDataId.txt

# 人数をカウント
curl -X PUT "http://localhost:3001/v1/congestion_data/${congestionDataId}" -d "people=${people}"
