#!/bin/sh

read placeId < /opt/CongestionStatusGraspScript/data/placeId.txt

# 計測を開始する
curl -X POST "http://localhost:3001/v1/congestion_data" -d "place_id=${placeId}" | jq '.data.id' > /opt/CongestionStatusGraspScript/data/congestionDataId.txt

# 5分毎に定期実行
echo "*/5 * * * * root /opt/CongestionStatusGraspScript/regular_shooting.sh" > /etc/cron.d/regular_shooting

# 1分毎に定期実行
echo "*/1 * * * * root /opt/CongestionStatusGraspScript/regular_status.sh" > /etc/cron.d/regular_status

/etc/init.d/cron restart
