---
title: 接続詞ステップ
date: 2014-02-23 22:45 JST
tags:
---

原文 : [Conjunction Steps (Antipattern)](https://github.com/cucumber/cucumber/wiki/Conjunction-Steps-(Antipattern))

オンライン辞書の Merriam-Webster によれば:

> con·junc·tion :an uninflected linguistic form that joins together sentences, clauses, phrases, or words

> 文や節、熟語や単語を結ぶ、語形変化しない語学上の構造

これをステップでやらないでください。
これはステップを特化や再利用しにくくします。
そのため、 Cucumber は接続詞のためのサポート (かつ、しかし) が組込まれています。

## 例

```gherkin
前提 サングラスとマスタングを持っている
```

## 直し方

```gherkin
前提 サングラスを持っている
かつ マスタングを持っている
```

## 接続詞ステップが問題ない場合

ときどき、シナリオを読み易くするためにいくつかのステップを 1 つにまとめたくなります。
[ステップのステップ定義からの呼び出し](https://github.com/cucumber/cucumber/wiki/Calling-Steps-from-Step-Definitions) はこれを可能にしますが、
小さなステップを作ることであなたの作業がより簡単になります。

--------------------------

ここで言う conjunction って "接続詞" だったか...
"結合したステップ" とかかと思ってたけれど辞書の引用を見て気づいた

あと、マスタングって車?
