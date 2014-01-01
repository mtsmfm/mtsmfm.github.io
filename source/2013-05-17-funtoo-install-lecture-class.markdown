---
layout: post
title: Funtoo Linux インストール講習会 いってきました
date: 2013-05-17 21:12
comments: true
categories: 
---

[第1回 Funtoo Linux インストール講習会](http://esminc.doorkeeper.jp/events/3547)
に行ってきました。

Gentoo には以前 @ursm さんに紹介していただき
インストールしてみたりしましたが、なかなかうまくいかないことも多かったので
挫折気味でした。

この度 Funtoo の インストール講習会があるということで、
そもそも Funtoo と Gentoo とは何が違うのかもよく分かっていないレベルでしたが、
これを機に再び挑んでみようという感じで事前に数回インスコしてから参加しました。

基本的にほとんど [公式ドキュメント](http://www.funtoo.org/Funtoo_Linux_Installation)
通りで進めていきました。

書いていなかった点としては、

* あらかじめ ブータブルUSBを用意してきたものを共有して使うために、SystemRescueCd の起動時
のオプション 2番の mem cache で起動した
* `start x` して、midori で インストールガイドを見ながら進めた

というところです。

途中、全員で一気に stage3 の tar を落としにいったからか
なかなかダウンロードが終わらなかったり、
LANハブが電源から抜けて emerge --sync が止まったり、
人によっては debian sources のコンパイルが終わらなかったりと
いろいろあったりしましたが、
手順の再確認やeixやoverlayを使うと便利！
といった情報を得ることができました。

debian sources では、特にkernelの設定は必要ないため
特にそのあたりで困ったことはありませんでしたが、
講習会後に自分で設定して kernel パニック になったり
gnome の設定で詰まったりしながら
なんとかこうして日記を書ける程度の環境を作った手順について
備忘録も兼ねて後程書こうと思います。

@ursm さん、 @kenchan さんありがとうございました。
