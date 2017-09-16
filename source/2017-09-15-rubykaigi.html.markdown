---
title: RubyKaigi 2017 で Language Serverの話をします
date: 2017-09-15 01:00 JST
tags:
---

RubyKaigi 2017 で Language Server の話をします。
[http://rubykaigi.org/2017/presentations/mtsmfm.html](http://rubykaigi.org/2017/presentations/mtsmfm.html)

この発表を通じて、Language Server というもの、その考え方を知ってもらい、
「あのエディタならこの便利プラグインがあるがこのエディタにはない」という状況が発生しないようにすることで、開発者が Ruby をさらにキメやすくなるといいなぁと思っています。
また、Ruby の静的解析について僕自身手探りな状態なので、情報交換ができれば嬉しいです。

Language Server とは、補完や定義ジャンプ、シンタックスエラーの検出といった、エディタに向けた便利機能を提供してくれるサーバです。
具体的にどのようにエディタとやり取りするかは [Language Server Protocol](https://github.com/Microsoft/language-server-protocol) に定義されています。

Ruby におけるエディタの補完は基本的にバッファから単語を出してくるだけだと思うのですが、これがもっと便利になったらいいなぁと思い、
[language_server という gem](https://github.com/mtsmfm/language_server-ruby) を作っています。
現状、 language_server gem では、 `ruby -wc` によるシンタックスエラーおよび警告の検出、 rcodetools による動的情報を利用した補完、
そして (まだ完璧ではないですが) 自前実装による定数の補完と定義ジャンプができます。

また、プロトコル部分は [language_server-protocol](https://github.com/mtsmfm/language_server-protocol-ruby) として切り出したので、
簡単に Ruby で Language Server を書き始めることができます。

このセッションでは、大きく 3 つの内容を話す予定です。

1. Language Server とは何か
2. Ruby で Language Server はどう作ればいいか
3. language_server gem の紹介

登場するキーワードとしては、以下のようなものが出てきます。一応発表内でも簡単に説明する予定です。

- [Language Server Protocol](https://github.com/Microsoft/language-server-protocol)
- [JSON RPC](http://www.jsonrpc.org/specification)
- [Ripper](https://docs.ruby-lang.org/ja/2.4.0/library/ripper.html)

Language Server とは結局のところ LSP さえ喋れれば裏側は自由なハブのようなものなので、 (LSP の語彙力の範疇であれば) Rubocop など他のツールを動かすこともできます。
[RubyKaigi 2017 タイムテーブル徹底解説](http://magazine.rubyist.net/?preRubyKaigi2017-01) にあるように、型や静的解析についての発表がいくつもあるので、
これらの話を聞いて組み込んでいけたら便利そうです。

それでは広島で。
