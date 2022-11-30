## THETA API リファレンス

https://github-com.translate.goog/ricohapi/theta-api-specs/blob/main/theta-web-api-v2.1/getting_started.md?_x_tr_sl=en&_x_tr_tl=ja&_x_tr_hl=ja&_x_tr_pto=wapp

## ファイル概要

### run_calc_area.sh

面積計算を開始する。
360 度画像が撮影され、面積計算プログラムが起動する

### post_v1_places.sh

以下のエンドポイントを叩く。  
コマンドライン引数で地点名を入力することで、data/placeAreaValue.txt に入っている面積情報と共に送信する

```
POST /v1/place?name={計測地点名}&area={面積}
```

### regular_shooting.sh

定点撮影するスクリプト。
こちらが実行されている間、定期的に 360 度カメラで撮影する。
