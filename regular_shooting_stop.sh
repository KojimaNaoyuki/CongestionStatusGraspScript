#!/bin/sh

# 定期実行を終了
rm -f /etc/cron.d/regular_shooting

/etc/init.d/cron restart
