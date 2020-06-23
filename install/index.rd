=begin JA
== インストールメモ
* パッケージのインストールは (({apt-get install パッケージ名})) で実行する（root権限）。
* パッケージの検索は (({apt-cache search キーワード})) で実行する。
* インストールした deb パッケージの詳細は (({dpkg -s パッケージ名})) で確認できる。

=== テキストエディタ
==== LibreOffice
ドキュメント作成、表計算、プレゼンテーション資料作成などに使う。
   sudo apt-get install libreoffice
==== vim
   sudo apt-get install vim
==== emacs
   sudo apt-get install emacs
   sudo apt-get install yatex

* yatex: emacsでのTeXモード。TeX書くときに便利（インストールに時間かかります）
* (({less})) で編集モードに移行するときはデフォルトは(({vim}))が起動するので、(({emacs}))にするには以下の一文を(({.bashrc}))に記載しておく。
   export EDITOR=/usr/bin/"emacs -nw"

=== ((<地球流体電脳倶楽部謹製品 Debian パッケージ集|URL:http://www.gfd-dennou.org/arch/cc-env/debian-dennou/>))
* 地球流体電脳倶楽部の謹製品の Debian パッケージのインストールは上記リンク先から。

=== データ解析関係のソフトウェアインストール
==== Fortran
   sudo apt-get install gfortran

==== Cコンパイラ
   sudo apt-get install gcc

==== Rubyインタープリター
   sudo apt-get install ruby

==== NetCDF
   sudo apt-get install netcdf-bin libnetcdf-dev netcdf-doc

==== 数値モデル用ライブラリ(電脳製品)
   sudo apt-get install ispack spml

==== 作図・データ解析(電脳製品)
   sudo apt-get install dcl-f77
   sudo apt-get install gphys

==== 作図・データ解析(その他)
GrADS
   sudo apt-get install grads
Gnuplot
   sudo apt-get install gnuplot
NCL
   sudo apt-get install ncl-ncarg ncl-tools

=end JA
