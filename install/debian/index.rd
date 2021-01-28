=begin JA

= Debian GNU/Linux 10 (buster) のインストールメモ
== 経緯
* Debian stretch を upgrade して buster を使っていましたが、どうも動作が不安定だったので、最初からインストールし直すことにしました。
* 気象学研究室時代のインストール大会の手順をベースに、今回のインストールを実施しました (2020/12/30実施)。
   * ((<納多さんのページ (Debian GNU Linux 9 (Stretch) のインストール)|URL:https://www.gfd-dennou.org/member/noda/edu/2017/debian_install.htm.ja>)) (2017年春研究室で実施)
   * ((<西本さんのページ (Debian 8 (Jessie) のインストール) |URL:http://www.gfd-dennou.org/arch/eriko/koshu/2016/OS/debian_install.html>)) (2016年春研究室で実施)
* 本ページはこれらの revision (ただし偏見含む) であると理解してください。

=== 参考
* Debian公式HPのインストールガイド
  * ((<Debian GNU Linux インストールガイド (64bit版)|URL:https://www.debian.org/releases/stable/amd64/>))
  * ((<Debian GNU Linux インストールガイド (32bit版)|URL:https://www.debian.org/releases/stable/i386/>))
== 準備
=== USBデバイス名の確認
* インストール用のUSBはDebianで作成します。そのあとでUSBから起動して Debian buster をインストールします。
* 以下のコマンドでUSBデバイス名を確認します。自分の場合、(({/dev/sdb})) にあたるようです。
   $ su
   # fdisk -l

=== インストールイメージを取得する
* Debian の公式HPからインストールイメージをダウンロードします。wgetで取得します。
* 2020/12/30時点での最新版は、(({debian-10.7.0-amd64-netinst.iso}))
   # wget https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.7.0-amd64-netinst.iso

=== USBメモリにisoファイルを焼く
* 以下のコマンドを打鍵し、USBメモリに焼きます。sudo では「許可がありません」とエラーが出るので、root で必ず実施します。
   # cat debian-10.7.0-amd64-netinst.iso > /dev/sdb
   # sync

== USBメモリからインストール
=== ネットワークに接続する
無線LANで当初試したが、DHCPの自動設定で失敗したので有線LANが無難です。
=== USB挿してPC起動
途中で聞かれる質問には以下のように回答しました。
* Install
* Language: (({日本語}))
* 場所の選択: (({日本}))
* キーボードの設定: (({日本}))
* ネットワークハードウェアの検出: (見つからないファームウェアがあった場合、その名前をメモしてから) (({いいえ}))
  * 私の環境では以下の2つが見つかりました
      iwlwifi-6050-5.ucode
      iwlwifi-6050-4.ucode
* ネットワークファームウェアの検出 (聞かれないかも): (({いいえ}))
* プライマリネットワークインターフェース (聞かれないかも): (({eth0}))
* ホスト名: お好きなものに (今回は(({debian}))とした)
* ドメイン名: (({kugi-mete})) (別になんでもよいだろうが、研究室時代の名残)
* root のパスワード:
* 新しいユーザーの本名:
* アカウントのユーザー名: (({matsuba})) (ここは各自）
* 新しいユーザーのパスワード: (rootのとは一緒にしない)
* パーティショニングの方法: (({ガイドーディスク全体を使う})) (お好きに)
* パーティショニングするディスクの選択: (({SCSI1})) (HDDのほうを選択)
* ディスクのパーティショニング: (({すべてのファイルを1つのパーティションに}))
  * 変更内容を確認して、(({パーティショニングの終了とディスクへの変更の書き込み}))
  * 「ディスクに変更を書き込みますか？」に(({はい}))
  * (少し時間がかかります)
* Debianアーカイブミラーの国: (({日本}))
* Debianアーカイブミラー: (({dennou-k.gfd-dennou.org}))
* httpプロキシの情報: (({なし})) (空白で続ける)
* Debianパッケージ利用調査に参加しますか: (お好きに)
* インストールするソフトウェアの選択:
  * Debianデスクトップ環境: (({GNOME})) (お好きに)
  * プリンタサーバ
  * SSHサーバ (((:<font color=red>デフォルトでは選択されていないので注意</font>:)))
  * 標準システムユーティリティ
* (少し時間がかかります。マシンや選択したソフトウェアに依りますが、30分程度)
* ハードディスクへのGRUBブートローダのインストール: (({はい}))
* ブートローダをインストールするデバイス: (({/dev/sda})) (HDDのほう)
=== インストール完了
USBを引き抜いてから再起動します (USB挿しっぱなしだと再びインストーラーが起動してしまいます)

== 基本情報の設定
=== 端末の確認
* 画面左上の「アクティビティ」
* 検索ワードで「terminal」と入力すると「端末」が候補に表示されるので選択
  * (余談) 検索ワードで入力する際に、何故か日本語入力ができなかったので、「端末」の文字列をコピペして貼り付けました・・・
  * まさか「terminal」と入力すればよかったとは。。。

=== rootになれるか確認
* 以下のコマンドを打ち、端末の "$" の部分が "#" に変わったら root になっています。root から抜ける際には (({exit})) で。
   $ su -

=== Emacsのインストール
* エディタとして普段emacsを使用しているので、まずはその準備から。
   # apt install -y emacs

* 起動するデフォルトのエディタをemacsにしておきたいので、通常ユーザーに戻って(({~/.bashrc}))に以下のように書き込みます。(({-nw}))は no windowのオプションです (私はこのやり方で使用しています)
   export EDITOR=/usr/bin/"emacs -nw"

* (({~/.bashrc}))の書き換えが終わったら、設定を反映させます。
   $ emacs -nw ~/.bashrc     # ~/.bashrc への書き込み
   $ source ~/.bashrc        # 設定の反映

=== sudoの設定
* 毎回rootになるのは面倒なので、sudoできるようにします。
   # apt install -y sudo
   # visudo
  * (({visudo}))起動時には違うエディタが起動するのですが、ここだけ我慢します。 
* (({# User privilege specification}))の行を探し、次のように書き換えます。
  * (({username}))とある部分は自分のアカウント名に読み替えてください。
   # User privilege specification
   root       ALL=(ALL:ALL) ALL
   username   ALL=(ALL:ALL) ALL
   Defaults:username  !env_reset

=== aptの設定
* root になったうえで(({/etc/apt/source.list})) を開きます。sudo で作業しても同じことです（# とある部分は $ sudo に読み替えてください）
   # emacs -nw /etc/apt/source.list

* 次のように書き直します。(({contrib})) と (({non-free})) を付け足します。
   deb http://dennou-k.gfd-dennou.org/debian/ buster main contrib non-free
   deb-src http://dennou-k.gfd-dennou.org/debian/ buster main contrib non-free

   deb http://security.debian.org/debian-security buster/updates main contrib non-free
   deb-src http://security.debian.org/debian-security buster/updates main contrib non-free

* 電脳製品(DCLなど)を取得するために配布先を付け足します。
   deb http://www.gfd-dennou.org/library/cc-env/Linux/debian-dennou buster main
   deb-src http://www.gfd-dennou.org/library/cc-env/Linux/debian-dennou buster main

* 利用するには公開鍵の登録が必要なので、((<地球流体電脳倶楽部謹製品 Debian パッケージ集|URL:http://www.gfd-dennou.org/arch/cc-env/debian-dennou/index.htm.ja>))を参考に、以下のように鍵を登録します。
   # apt-get install debian-keyring
   # gpg --keyring /usr/share/keyrings/debian-maintainers.gpg --export -a 891D7E07 | apt-key add -

* 最新版のソフトウェアにアップデートするために以下を実行します。
   # apt update
   # apt upgrade

=== ホームディレクトリのディレクトリ名を英語に
* コマンドラインで以下のようにします。
   $ LANG=C xdg-user-dirs-gtk-update
* 「次回から表示しない」(英語で Don't ask me this again と表示されるかもしれません）にチェックを入れた上で Update Names を選択します。

=== ファームウェアのインストール (無線LAN関係)
* 見つからなかったファームウェア (({iwlwifi-6050-5.ucode})) について、((<URL:https://www.debian.org/distrib/packages>)) で適合するパッケージを検索すると (({firmware-iwlwifi})) と分かりましたので、これをインストールします(無線LANに関するファームウェアでした)。
   # apt install -y firmware-iwlwifi

* PCを再起動すると、無線LANが使えるようになりました。

=== プリンタの設定
* これは別のページで手順を記載します (準備中)。
  * 私の環境では Brother DCP-J715N プリンタに適合させる必要があります (一般的な話ではありません)。

== データ解析関係ソフトウェアのインストール
=== プログラミング言語
* Fortranコンパイラ
   # apt install -y gfortran

* Cコンパイラ
   # apt install -y gcc
   
* Rubyインタープリター
   # apt install -y ruby

=== データフォーマット
* NetCDF
   # apt install -y netcdf-bin libnetcdf-dev netcdf-doc

=== 作図・データ解析 (電脳製品)
* Fortran版DCL・GPhys
   # apt install -y dcl-f77
   # apt install -y gphys
  * (({RubyDCL})) は (({GPhys})) をインストールした際に一緒にインストールされると思います。これの詳しい使い方は別ページにて。

=== 数値モデル用ライブラリ (電脳製品)
* ISPACK・SPMODEL
   # apt install -y ispack
   # apt install -y spml

== 文書関係ソフトウェアのインストール
=== テキストエディタ
* yatex: emacs での TeX モード。TeX書くときに便利。(結構パッケージ取得するのでインストールに時間かかります)
   # apt install -y yatex

=== ビューア
* EPSファイルやPDFの閲覧で必要
   # apt install -y evince
   # apt install -y gv

=== LaTeX
* TeXで文書を書く
   # apt install -y texlive-lang-cjk   # 日本語環境
   # apt install -y xdvik-ja
   # apt install -y texlive-latex-extra

== さいごに
* これ以外にも必要となるパッケージが出てくると思いますが、その都度、パッケージを検索して (({# apt install -y パッケージ名})) と対処しましょう。

((<一つ上に戻る|URL:../index.html>))

((<トップページに戻る|URL:../../index.html>))

=end JA
