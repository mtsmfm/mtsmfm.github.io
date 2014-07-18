---
title: Gentoo での Nexus 5 による USB テザリング
date: 2014-07-19 02:48 JST
tags:
---

カーネルの設定で、以下の内容にチェックを入れる。

```
Device Drivers
  Network device support
    USB Network Adapters
       <*> Multi-purpose USB Networking Framework
       -*-   CDC Ethernet support (smart devices such as cable modems)
       <*>   Host for RNDIS and ActiveSync devices
```
