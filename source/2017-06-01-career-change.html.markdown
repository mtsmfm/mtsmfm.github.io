---
title: 転職しました
date: 2017-06-01 21:00 JST
tags:
---

5月末で[永和システムマネジメント](http://agile.esm.co.jp) を退職し、[Quipper](https://www.quipper.com/) に入社してました。

前職は新卒で入社し、学生時代コード書ける方とか思ってたけれど微塵もできないことを突きつけていただいたり、
プログラマとしてのありかた、仕事のやり方など非常に多くのことを学ばせていただきました。

仕事だけでなくコミュニティ面でも多くの刺激を得ることができ、西日暮里.rb とか OSS とかもこの会社にいなければしなかっただろうなぁと思います。

中でも一番影響を受けたのは [@tkywtnb](https://github.com/tkywtnb) さんの「まずは自分の母国語と呼べる言語を作れ」という言葉で、
そこから Ruby をだいぶ学び直したりして、とても Ruby が好きになりました。

好き勝手やってたら評価もしていただき、事業部の MVP やリードプログラマという役職を頂いたのは大きな励みになりました。

一方、受託開発会社よりサービス会社に興味が出てきたり、 OSS などでもうちょっと英語うまいこと言えたらなーと思っていたりしていた中、
知人に声をかけていただいてこの度転職することにしました。

5月いっぱい有給消化で暇だったので、 Relay Modern を ActionCable とくっつけて遊んだり、ひたちなかに行ったり、[Ruby 用の Language Server を作ったり](https://github.com/mtsmfm/language_server-ruby)
川越で食べ歩きしたり [GraphQL のイベント](https://www.meetup.com/ja-JP/GraphQL-Tokyo/) をやったり[謎の薬剤に足を浸したり](https://www.amazon.co.jp/dp/B01LSJB3K2) macOS で Docker 縛り開発の実験をしてました。

Docker for Mac は volume のマウントが遅い遅いとは聞いていましたが、 Linux の Docker 上だと 1 秒かからないものが 30 秒以上かかるのにはたまげました。
最近[ユーザによる cache 宣言をする機構が入って3倍早くなった](https://blog.docker.com/2017/05/user-guided-caching-in-docker-for-mac/)とのことでしたが、それでも 10 倍遅いのでつらみ。
ただ [docker-sync](http://docker-sync.io/) 使ったら Linux と遜色ないレベルになったので docker-sync はすごい。

Language Server は現状 `ruby -wc` と rcodetools による補完くらいしかないですが、 parser とか使ってもうちょっとがんばっていきたいところ。
[jedi](https://github.com/davidhalter/jedi) とか [php-language-server](https://github.com/felixfbecker/php-language-server/) あたりを参考にするといいのだろうか。
vscode をお使いのみなさまは[すぐに試せるのでどうぞ](https://marketplace.visualstudio.com/items?itemName=mtsmfm.ruby-lsc)。
これも開発は Docker 縛り。

転職してもまたすぐ[どう書くで出題しに行く](https://yhpg.doorkeeper.jp/events/59397)ので仲良くしてください。

例のリスト置いときますね: [http://amzn.asia/c0EKuDP](http://amzn.asia/c0EKuDP)
