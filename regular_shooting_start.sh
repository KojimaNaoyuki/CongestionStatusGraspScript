#!/bin/sh

# 計測を開始する
curl -X PUT "http://localhost:3001/v1/congestion_data" -d "place_id=$1"

# 5分毎に定期実行
echo "*/5 * * * * kojima regular_shooting.sh" > /etc/cron.d/regular_shooting

/etc/init.d/cron restart
