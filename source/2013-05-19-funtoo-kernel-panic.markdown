---
layout: post
title: カーネルパニック
date: 2013-05-19 10:30
comments: true
categories: funtoo
---

Funtoo Linux インストール講習会では、カーネルに debian sources を用いました。
もろもろが一通り入ってるので起動しないことはまずないですが、
コンパイルに時間がかかる、使わないものまで読み込まれるといった不便な点もあるみたいです。
@ursm さんにカーネルを自分で設定するようお勧めされたこともあり、
講習会後に gentoo sources によるカーネルコンパイルに挑戦してみました。

[gentoo インストールガイドのカーネル設定](http://www.gentoo.org/doc/en/handbook/handbook-x86.xml?part=1&chap=7)を頼りにしていたらカーネルパニックになり、
起動した後も wifi がうまく動かなかったので iwlwifi をモジュールとして入れたら
なんとかなったよというお話。

## 自分のハマりどころや教えていただいた便利情報など

インストールガイド内の設定を見ながら、噛み合わない部分を飛ばしたら結局 XFS ファイルサポートくらいしか弄らずにコンパイル。すると、

```
Unable to mount root fs on unknow block(0,0)
```

という感じでカーネルパニックに。

boot.conf にはgentoo sources の場合には initrd や params は不要らしいと
教わり、さらに /boot 下に bzImage をコピーするだけではダメだそうで。
`make install` して /boot 下にカーネルの設定ファイルとセットで置かなければならないと。
それでも起動せず、カーネルの設定を見直したら AHCI サポートのチェックがはずれており(おいおい)なんとか起動。

しかし wifi の挙動が何かおかしい。debian sources のときも繋ったと思ったらすぐ使えなくなったりだった。
こりゃよくわからんともう一度funtooインストールガイドの一番最初からやり直して、今度は途中で debian sources 入れずに gentoo sources で設定をしてみる。

すると、なんということでしょう。 AHCI サポートにチェックが入っているではありませんか。
**自分で弄った可能性も高い**が、debian sources を入れたあとと、最初から gentoo sources を入れたときではデフォルトの設定が違うかもしれない...

とりあえず iwlwifi にチェックを入れてコンパイル。
無事起動したが、やっぱり wifi がなんかおかしい。
なんとなく モジュール としてコンパイルしてみるとうまくいきました。

## まとめ

* `make install`しよう
* iwlwifi は モジュールとして入れよう
* boot.conf は書くことほとんどないよ
* `make menuconfig`ではなくて`make nconfig` すると検索とかできて便利だよ
* Rescue CDで起動したあとに `lspci -k` してドライバとか何つかってるか見れるよ

備忘録として、カーネルコンパイルしてgrubの設定するまでの流れを書いておく。

```
emerge gentoo-sources
cd /usr/src/linux
make nconfig
make && make modules_install
make install

emerge boot-update
vi /etc/boot.conf
grub-install --no-floppy /dev/sda
boot-update
```
