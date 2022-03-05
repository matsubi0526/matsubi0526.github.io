=begin JA
== Pythonで自宅のWi-Fi環境を計測してみる
* speedtestを使って自宅のWi-Fi環境の速度測定をしてみた。
  * 毎時2分にスクリプトをcrontabで定期実行させて、結果をcsvファイルに出力させている。
  * ほんとはpythonで箱ひげ図を描きたかったけど、やっぱりDCLで描いてしまった。

=== 以下、メモ
  * ((*2022/03/04追記*)):
    * このスクリプトを動かしているノートPCが10年モノのため無線LANの規格が古く、本来の速度が出ていないことが判明。
    * 別のPCでspeedtest(Web版)を試すと、軽く100Mbpsは出る。
  * ((*2022/02/23追記*)):
    * 測定結果を散布図に描いてみた。
    * 上り速度が平均30Mbpsでほぼ一定だと思っていた。
    * だけど、頻度分布を見るとbimodalになっていたのね。

=end JA
# ---- 画像を入れる(ここから) ----
=begin HTML
<div style="text-align:left;"> 
<img src="dcl_0001.png" height="350"><img src="test1.png" height="350">
</div>
=end HTML
# ---- 画像を入れる(ここまで) ----
=begin JA

((<一つ上に戻る|URL:../index.html>))

((<トップページに戻る|URL:../index.html>))
=end JA
