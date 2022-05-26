=begin JA
== その他のパッケージのインストール
=== dennou6.styのインストール
導入の仕方は本家のページ（((<GFD Dennou Club Resources: 地球流体電脳倶楽部 TeX スタイルファイル|URL:https://www.gfd-dennou.org/library/cc-env/TeXmacro/dennou/>))）を参照のこと
* debパッケージからインストールすることとし、(({wget}))でdebパッケージを取得
   $ wget https://www.gfd-dennou.org/library/cc-env/TeXmacro/dennou/dennou-sty-6_0.6.10-1.1_all.deb

* ダウンロードしたファイルを(({dpkg -i}))でインストールする
   $ sudo dpkg -i dennou-sty-6_0.6.10-1.1_all.deb

* インストールが成功すれば、(({dennou-sty-6}))ディレクトリが出来上がっている
   $ ls /usr/share/texmf/tex/ptex/dennou-sty-6/
   D6comment.sty D6graphicx.sty D6misc.sty D6select.sty D6version.sty
   D6float.sty   D6math.sty     D6prog.sty D6style.sty  Dennou6.sty

* あとはTeXファイルのプリアンブルに以下のように記載して使用することができる
   \usepackage{Dennou6}
   
=end JA
