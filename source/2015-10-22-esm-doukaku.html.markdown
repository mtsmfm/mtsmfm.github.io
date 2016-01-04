---
title: ESM オフラインリアルタイムどう書くを開催しました
date: 2015-10-22 00:00 JST
tags:
---

[オフラインリアルタイムどう書く](https://yhpg.doorkeeper.jp) という、
[@Nabetani](https://twitter.com/Nabetani) さん主催のイベントを模したものを
[ESM](http://agile.esm.co.jp) の社内イベントとして行いました。

[問題はこちら](https://gist.github.com/mtsmfm/4b8ffb53ffac055f5843)

## 開催の経緯

オフラインリアルタイムどう書くは [@Nabetani](https://twitter.com/Nabetani) さんが当日出題した問題を 1 時間で解いて、解けたり解けなかったりした結果を互いに発表する、というイベントです。
過去に何回か参加し、なかなかにおもしろいのでこういうのを社内でも次は出題者としてやってみたいなぁと思っていました。

一方、ESM では 60 min という、ハンズオンなどを有志が開催して都合がつく人が参加する 1 時間イベントがあります。
相談してみたところ拡大版ということで 180 min ほどいただくことができたので、10/22 (木) に開催しました。

## 問題づくり

[@mattsan](https://github.com/mattsan) に問題作りに協力していただきつつ、
どう書くの問題を見たり、[@torazuka さんの記事](http://d.hatena.ne.jp/torazuka/20140512/doukaku) を読んだりしながら問題を考えていました。

## 当日の流れ

問題の形式やタイムテーブルなど、大部分をオフラインどう書くの内容をほぼそのまま真似させていただきました。

gist の方には 「終わったら gist に URL コメントしてね」と書きましたが、idobata でリモートから流れを追ってる人もいたりしたので idobata 上に貼ってもらってました。

## 結果

12 人参加して時間内に解けたのが 1 人だけ (さすが [@takkanm](https://github.com/takkanm) パイセン!) だったので、15 分延長したら半数くらいの方が解けた感じでした。
(自分も別言語でリトライしたら結局 15 分延長でクリア...)

## 感想

問題を出す側になってみて感じたのは、「おもしろい問題にする」ということの難しさでした。
当初の案では席が一直線だったのですが、自分でやってみて、解けてもなんかあまりおもしろくなかったです。
[@mattsan](https://github.com/mattsan) さんから「席を円形にする」というアイデアをもらって、試してみるとそこまで難易度が大きくあがらないのに
解けたときになんとなくおもしろいと思えました。
(この「なんとなく」を感じ取るのが問題を出すセンスなんですかね)

反省点としては、参加人数が少なかったなーというところです。
3 時間もらうということで調整がつかず参加できなかったメンバーが少なからずいました。

次回には「解き方が複数ある問題にする」、「参加人数を増やすべく時間を減らす or 日付を調整する」あたりを try としてまたやれるといいなぁ。

## 自分の実装

- [Ruby](https://gist.github.com/mtsmfm/4f11795ad0d1bccc9d75)
- [JS](https://esa-pages.io/p/sharing/1699/posts/292/fa8d0bd9f7189b9e8a3b.html)

Ruby だと redo が便利ですね。
rotate してるところは自分で見返すともう読めない。

JS の方は ES6 とかとっさに頭から出るほど使えていないので、なにそれおいしいの状態で突撃。
せめて coffee にすればよかったと数分後に後悔。
どこに何人入るかが分かってもそれを 2 進数の値にするところで詰まった && どう書くだとこんな手もあったりするんですよ〜というご紹介として 64 通り書く力技をしてみました。

## みんなの実装 (敬称略)

ありがたいことに、後日別の言語で解き直す方や、インターネットで見かけて参加してくださる方もいらっしゃいました。

当日、後日と解いてくださったみなさんありがとうございました!

解いたのに載ってない! という方は [@mtsmfm](https://twitter.com/mtsmfm) まで or [直接 PR](https://github.com/mtsmfm/mtsmfm.github.io) どうぞ。

### 当日

#### @takkanm

- [Ruby](https://gist.github.com/takkanm/17ca09fdd8eaa626c32e)

#### @mattsan

- [C++](https://gist.github.com/mattsan/6511934d510363322b95)

#### @fkino

- [C](https://gist.github.com/fkino/9f9aaff42cc81356c873)

#### @aikyo02

- [Ruby](https://gist.github.com/aikyo02/9ddd7b29460f429c7a35)

#### @fossamagna

- [JS](https://gist.github.com/fossamagna/ab2208f767b26c301415)

### 後日

#### @Nabetani

- [Ruby](http://qiita.com/Nabetani/items/e15581b45b4a569df2d6)

#### @takkanm

- [C](https://gist.github.com/takkanm/f8822c0a97e9f1ee1a05)

#### @mattsan

- [Prolog](https://gist.github.com/mattsan/2e2bcfb6ca4e298c00fe)
- [C++](https://gist.github.com/mattsan/9362c647e858460c1ec4)

#### @narinari

- [Haskell](http://qiita.com/narinari/items/204996ac13f7d84e858b)

#### @nakana

- [Clojure](https://gist.github.com/nakana/6227290a07e102dfbe49)
- [C](https://gist.github.com/nakana/a0d45ade0a59ad216598)
- [まさかのラーメン屋シミュレータ](https://output.jsbin.com/qaneca)

#### @cielavenir

- [Ruby](http://qiita.com/cielavenir/items/fa6e7b4e79e1673bbe05)
