#!/bin/sh

# 定期実行を終了
rm -f /etc/cron.d/regular_shooting
rm -f /etc/cron.d/regular_status

/etc/init.d/cron restart
