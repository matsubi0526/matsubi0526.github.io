=begin JA

= Debian GNU/Linux 11 (bullseye) のインストールメモ
== 経緯
* 学生時代に購入したLet's Note に Debian buster をインストールして使っていたが、さすがに購入から11年が経過したことから、新しいPCへ移植させることとした。
* 所持しているWindows PCはまだ現役として機能できることから、中古でLet's Noteを購入し、Debian bullseyeをインストールして使うこととした。

=== 中古Let's Noteのスペック
* Debian buster をインストールしていたLet's Noteと比較して格段に処理速度が早いです(当たり前)
  * Panasonic Let's Note
  * CF-SZ6ED9QS
  * CPU: Intel(R) Core(TM) i5-7200U @2.50GHz
  * メモリ: 8GB
  * ディスク: SSD 256GB
  * 無線LAN: IEEE802.11a/b/g/n/ac

=== インストール実施月
* 2022年02月: イメージディスクの作成
* 2022年04月: Debian bullseyeの基本インストール

=== 参考
* Debian公式HPのインストールガイド
  * ((<Debian GNU Linux インストールガイド (64bit版)|URL:https://www.debian.org/releases/stable/amd64/>))
  * ((<Debian GNU Linux インストールガイド (32bit版)|URL:https://www.debian.org/releases/stable/i386/>))

== 準備
=== USBデバイス名の確認
* インストール用のUSBはDebianで作成しました。そのあとでUSBから起動して Debian bullseye をインストールします。
* 以下のコマンドでUSBデバイス名を確認します。自分の場合、(({/dev/sdb})) にあたるようです。
   $ sudo -s
   # fdisk -l

=== インストールイメージを取得する
* Debian の公式HPからインストールイメージをダウンロードします。wgetで取得します。
* 2022/02/12時点での最新版は、(({debian-11.2.0-amd64-netinst.iso}))(378MB程度)
   # wget https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.2.0-amd64-netinst.iso

=== USBメモリにisoファイルを焼く
* 上記作業の続きです(sudo -s で root になっている状態)。以下のコマンドを打鍵し、USBメモリに焼きます。前回 buster をインストールしたときには sudo では「許可がありません」とエラーが出たが、今回は問題ありませんでした。
   # cat debian-11.2.0-amd64-netinst.iso > /dev/sdb
   # sync

=== PCのドライブ読み込み順の設定
* PCのBIOSで設定します。使っている機種によってBIOS起動の方法は異なります。
* USBドライブから優先的に起動するようにします。
  * 今回、Let's Note CF-SZ6で実施しましたが、BIOS起動が少々面倒でした。

== USBメモリからインストール
=== ネットワークに接続する
Debian10 busterのときにDHCPの自動設定で失敗した経験から有線LANで実施。
=== USB挿してPC起動
途中で聞かれる質問には以下のように回答。
* Install
* Language: (({日本語}))
* 場所の選択: (({日本}))
* キーボードの設定: (({日本}))
* ネットワークハードウェアの検出: (見つからないファームウェアがあった場合、その名前をメモしてから) (({いいえ}))
  * 私の環境では(({iwlwifi-8265-22.ucode}))から(({iwlwifi-8265-36.ucode}))までが見つからず
* ネットワークファームウェアの検出: (({いいえ})) (聞かれなかった)
* プライマリネットワークインターフェース: (({eth0})) (聞かれなかった)
* ホスト名: お好きなものに (今回は(({debian}))とした)
* ドメイン名: (({kugi-mete})) (別になんでもよいが、研究室時代の名残で設定)
* root のパスワード:
* 新しいユーザーの本名:
* アカウントのユーザー名: (({matsuba})) (ここは各自）
* 新しいユーザーのパスワード: (rootのとは一緒にしない)
* パーティショニングの方法: (({ガイドーディスク全体を使う})) (お好きに)
* パーティショニングするディスクの選択: (({SCSI3})) (SSDのほうを選択)
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
  * SSHサーバ (((:<font color=red>デフォルトでは選択されていないので注意</font>:)))
  * 標準システムユーティリティ
    * Debian buster のときにあった(({プリンタサーバ}))は選択肢になかった
* (少し時間がかかります。私の環境では10分程度)
* ハードディスクへのGRUBブートローダのインストール: (({はい})) (聞かれなかった)
* ブートローダをインストールするデバイス: (({/dev/sda})) (SSDのほう。聞かれなかった)
=== インストール完了
USBを引き抜いてから再起動します (USB挿しっぱなしだと再びインストーラーが起動してしまいます)

== 基本情報の設定
=== 画面解像度の変更
* 文字が小さいので(({1920x1200(16:10)}))から(({1280x800(16:10)}))に変更
=== 日本語入力
* 画面上で(({日本語(Mozc)}))に設定
=== 端末の確認
* 画面左上の「アクティビティ」
* 検索ワードで「terminal」と入力すると「端末」が候補に表示されるので選択
  * お気に入りに追加しておくとよいでしょう

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
   # User privilege specification
   root       ALL=(ALL:ALL) ALL
   username   ALL=(ALL:ALL) ALL
   Defaults:username  !env_reset
  * (({username}))とある部分は自分のアカウント名に読み替えてください。

=== aptの設定
* root になったうえで(({/etc/apt/source.list})) を開きます。sudo で作業しても同じことです（# とある部分は $ sudo に読み替えてください）
   # emacs -nw /etc/apt/source.list

* 次のように書き直します。(({contrib})) と (({non-free})) を付け足します。
   deb http://dennou-k.gfd-dennou.org/debian/ bullseye main contrib non-free
   deb-src http://dennou-k.gfd-dennou.org/debian/ bullseye main contrib non-free

   deb http://security.debian.org/debian-security bullseye-security main contrib non-free
   deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free

   deb http://dennou-k.gfd-dennou.org/debian/ bullseye-updates main contrib non-free
   deb-src http://dennou-k.gfd-dennou.org/debian/ bullseye-updates main contrib non-free

* 電脳製品(DCLなど)を取得するために配布先を付け足します。
   deb http://www.gfd-dennou.org/library/cc-env/Linux/debian-dennou bullseye main
   deb-src http://www.gfd-dennou.org/library/cc-env/Linux/debian-dennou bullseye main

* 利用するには公開鍵の登録が必要なので、((<地球流体電脳倶楽部謹製品 Debian パッケージ集|URL:http://www.gfd-dennou.org/arch/cc-env/debian-dennou/index.htm.ja>))を参考に、以下のように鍵を登録します。
   $ sudo apt-get install debian-keyring
   $ gpg --keyring /usr/share/keyrings/debian-maintainers.gpg --export -a 891D7E07 | sudo apt-key add -

* 最新版のソフトウェアにアップデートするために以下を実行します。
   $ sudo apt update
   $ sudo apt upgrade

=== ホームディレクトリのディレクトリ名を英語に
* コマンドラインで以下のようにします。
   $ LANG=C xdg-user-dirs-gtk-update
* 「次回から表示しない」(英語で Don't ask me this again と表示されるかもしれません）にチェックを入れた上で Update Names を選択します。

=== ファームウェアのインストール (無線LAN関係)
* 見つからなかったファームウェア (({iwlwifi-8265-22.ucode})) ほかについて、((<URL:https://www.debian.org/distrib/packages>)) で適合するパッケージを検索すると (({firmware-iwlwifi})) と分かりましたので、これをインストールします(Bluetoothに関するファームウェアでした)。
   # apt install -y firmware-iwlwifi

* PCを再起動します。
  
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
=== パッケージの検索
* 上記以外にも必要となるパッケージが出てくると思いますが、その都度、パッケージを検索して (({# apt install -y パッケージ名})) と対処しましょう。

=== インストールしたパッケージの検索
* (({dpkg -l}))でインストール済のパッケージを一覧表示できるので、(({grep}))コマンドでパッケージ名を絞り込むとよい。

=== 工事中
* その他インストールしたパッケージ(under construction...)

((<一つ上に戻る|URL:../index.html>))

((<トップページに戻る|URL:../../index.html>))

=end JA
