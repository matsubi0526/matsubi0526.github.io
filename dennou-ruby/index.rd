=begin JA
=== ((<地球流体電脳Rubyプロジェクト|URL:http://ruby.gfd-dennou.org/index.htm.ja>))
* 公開領域のメールアーカイブはこちら。
  * ((<URL:http://ruby.gfd-dennou.org/ml/index-j.htm>))
* 2014年を最後にメールアーカイブが更新されていないと思っていたが、非公開資源のほうで生きている（要認証）。
  * ((<URL:https://www.gfd-dennou.org/GFD_Dennou_Club/dc-arch/davis/ml-ruby/>))

== dennou-ruby ML
=== 質量流線関数の描画
* ((<[dennou-ruby:003457] Re: 質量流線関数の描画|URL:https://www.gfd-dennou.org/arch/ruby/ml/2011/msg00202.html>))
  * 愚直に定義にしたがい積分を差分化する
* ((<(Library) 質量流線関数の計算|URL:http://davis.gfd-dennou.org/rubygadgets/ja/?%28Library%29+%E8%B3%AA%E9%87%8F%E6%B5%81%E7%B7%9A%E9%96%A2%E6%95%B0%E3%81%AE%E8%A8%88%E7%AE%97>))
  * 高橋さん@神戸大 が投稿されている。for ループでの差分計算。
* ((<GAnalysis::MetZ::mass_strm_p|URL:https://www.rubydoc.info/gems/gphys/1.5.0/NumRu/GAnalysis/MetZ.mass_strm_p>))
  * gphys-1.4.2 リリースのタイミングで質量流線関数を計算するためのメソッドが GAnalysis::MetZ に整備されていた。
  * C で拡張したライブラリで高速化を図っているようである。

=== 地図投影で部分的に領域を図示したい
* ((<[dennou-ruby:002947] Re: map projection in GGraph|URL:https://www.gfd-dennou.org/arch/ruby/ml/2008/msg00070.html>))
  * 神代さんがまとめてくださっている。

=== GPhysにおける解析ライブラリ
* ((<[dennou-ruby:002988] Re: gphys analysis methods|URL:https://www.gfd-dennou.org/arch/ruby/ml/2008/msg00111.html>))
  * 基本的には自分で書くしかないという(当時の)現状。

=== GPhysに新機能を搭載するときの注意事項
* ((<[dennou-ruby:003116] Re: 質問：gphys|URL:https://www.gfd-dennou.org/arch/ruby/ml/2009/msg00093.html>))
  * 一般性を重視し、なるべく広い範囲で良い振る舞いをすることが望まれる。

=== DCLExt::datetime_ax の中間的日付ラベルの提案
* ((<[dennou-ruby:003320] DCLExt::datetime_ax  GGraph::__calendar_ax|URL:https://www.gfd-dennou.org/arch/ruby/ml/2011/msg00065.html>))
  * 結局これはボツになった?


=end JA
