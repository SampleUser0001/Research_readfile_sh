# Research_readfile_sh
shのファイル読み込みの調査

- [Research_readfile_sh](#research_readfile_sh)
  - [概要](#概要)
  - [環境](#環境)
    - [ディストリビューション](#ディストリビューション)
    - [改行コード](#改行コード)
    - [その他](#その他)

## 概要

何故か設定ファイルの2行目を読んでくれないので原因調査。  

## 環境

なるべく発生している環境に寄せる。

### ディストリビューション

Red Hat Enterprise Linux Server release 7.6 (Maipo)

### 改行コード

LF。EOF改行なし。



### その他

| 概要 | リンク |
| :-- | :-- |
| 読み込み対象ファイルの改行コードの違い | [リンク](./FILE_NEW_LINE.md) |
