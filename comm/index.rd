=begin JA
== 自作コマンド
* 便利だと思うコマンドについて紹介する。不定期に更新します。
  * 自分の環境の場合、(({/usr/local/bin}))に置いている。
=== trimpng
* 画像ファイルのトリミングをする。若干の余白を作る。
  * 以下のスクリプトを(({trimpng}))としてパスを通しているディレクトリに置いている。
  * (({mogrify}))を使うのでImageMagickがインストールされている必要がある。
      #!/usr/bin/ruby
      pngfile=(ARGV[0]||(puts "Input pngfile name for trimming"; gets.chomp!)).to_s
      p cmd = "mogrify -trim -bordercolor '#ffffff' -border 5%x5% #{pngfile}"
      system(cmd)

=== update_upgrade
* ただ単に(({apt update}))と(({apt upgrade}))を一緒に処理するだけ。
  * (({apt upgrade}))の際には(({y}))を選択しないとインストールはされない。
      #!/bin/bash
      set -ex
      sudo apt update
      sudo apt upgrade
      exit
=end JA
