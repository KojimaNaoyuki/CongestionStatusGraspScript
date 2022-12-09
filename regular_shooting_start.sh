#!/bin/sh

# 計測を開始する
curl -X POST "http://localhost:3001/v1/congestion_data" -d "place_id=$1"

# 5分毎に定期実行
echo "*/5 * * * * koji /opt/CongestionStatusGraspScript/regular_shooting.sh" > /etc/cron.d/regular_shooting

# 1分毎に定期実行
echo "*/1 * * * * koji /opt/CongestionStatusGraspScript/regular_status.sh" > /etc/cron.d/regular_status

/etc/init.d/cron restart
