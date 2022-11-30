#!/bin/sh

# 静止画撮影
curl -H "content-type: application/json; charset=utf-8" -X POST http://192.168.1.1:80/osc/commands/execute -d '{"name": "camera.takePicture"}'

sleep 5s

# 新規保存されたファイル名を取得
curl -H "content-type: application/json; charset=utf-8" -X POST http://192.168.1.1:80/osc/state | jq '.state._latestFileUrl' | tr -d \" | cut -f 5,6,7 -d "/" > ./data/takePicturedFilePath.txt

read filePath < ./data/takePicturedFilePath.txt

# 画像ファイルを取得
curl -H "content-type: application/json; charset=utf-8" -X GET "http://192.168.1.1:80/files/${filePath}" > ./../RAPiD/images/img.jpg

# 人数カウント
python ./../RAPiD_improvement/example.py
    
read people < ./../RAPiD/result/count.txt

# 人数をカウント
curl -X PUT "http://localhost:3001/v1/congestion_data/{congestion_data_id}" -d "people=${people}"