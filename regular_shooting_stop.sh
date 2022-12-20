#!/bin/sh

# 定期実行を終了
rm -f /etc/cron.d/regular_shooting
rm -f /etc/cron.d/regular_status

/etc/init.d/cron restart

read placeId < ./data/placeId.txt

curl -X DELETE "http://localhost:3001/v1/places/${placeId}"
