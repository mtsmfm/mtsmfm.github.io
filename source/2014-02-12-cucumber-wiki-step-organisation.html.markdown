---
title: Cucumber wiki を訳してみた (Step Organisation)
date: 2014-02-12 22:26 JST
tags:
---

[Cucumber wiki](https://github.com/cucumber/cucumber/wiki) がすごくよいことを書いてあるのでちゃんと読んだほうがよい、と
以前パイセンから教わった。
読んだがあまり身になっている気がしないので一度しっかり訳してみようと思った。
ステップ定義の構成についてとそのアンチパターンくらいは最低でも訳したいなぁ。

-----------------------

## [Cucumber wiki (Step Organisation)](https://github.com/cucumber/cucumber/wiki/Step-Organisation)

あなたはどのようステップ定義ファイルに名前をつけていますか?
また、ステップ定義には何を置いては *いけない* のでしょう?

これはより良いシナリオへと導くガイドラインです。
もしあなたがステップや全体的な記法についてよく知らないのであれば、最初に [フィーチャの紹介](https://github.com/cucumber/cucumber/wiki/Feature-Introduction) を読んでください。

## グループ分け

あなたがステップ定義ファイルにどんな名前を付けたりどのファイルにどのステップ定義を書いても、技術的には問題ありません。
all_steps.rb というような巨大なファイルに全てのステップ定義を書くことすらできます。だらしないですが。

私たちは分野の概念(domain concept)毎に steps.rb ファイルを作ることをオススメします。
例えば、主要なモデルやデータベースのテーブル毎に 1 つのファイルを持つのは大まかにはよい方法です。

履歴書アプリケーションでは私たちはきっと次のようなファイルを持つことになるでしょう:

* employee_steps.rb
* education_steps.rb
* experience_steps.rb
* authentication_steps.rb

最初の 3 つは、いろいろなモデルの読み書き更新削除に関した、 [前提-もし-ならば](https://github.com/cucumber/cucumber/wiki/Given-When-Then) 全てのステップを定義しているでしょう。
最後の 1 つはログインやログアウトに関したステップを定義しているでしょう。

もしあなたがこの規則に則るならば、[フィーチャと一対一なステップ定義群(アンチパターン)](https://github.com/cucumber/cucumber/wiki/Feature-Coupled-Step-Definitions-%28Antipattern%29) を避けることにもなります。


## ステップの状態

オブジェクトの状態を `@variables` のようにしてステップ定義中で保持することは可能ではあります。
しかし、これはステップを密結合に、そして再利用しづらくすることに気を付けてください。
絶対的なルールはここにはありません - 時には `@variables` を使うこともよいでしょう。
より長い議論については[こちら](http://www.mail-archive.com/rspec-users@rubyforge.org/msg06268.html)を参照してください。
