#!/bin/sh

# 定期的に通信を行わないと接続が切れてしまうため
curl -H "content-type: application/json; charset=utf-8" -X POST http://192.168.1.1:80/osc/state