# サーバ基盤情報管理ツール 

## 参考文献
(敬称略)
改訂新盤 基礎 Ruby on Rails 黒田努・佐藤和人 共著 株式会社 オイアクス 監修
この本のおかげでRailsアプリケーションを作ることができました。ありがとうございました。

## 目的
IT基盤、特にサーバリソースを一元管理するためのツールです。
通常、Excelでサーバ名を一覧化するが、サーバを必要とする人が直接Webブラウザから必要リソースを申請させることで管理を省力化することが目的です。

## 利用環境
以下のいずれか。但し後者の場合、Gemfile.winをGemfileにリネームしてbundle updateが必要でした。
- ubuntu 14.04(Rails4.2.0,ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-linux])
- Windows7(Rails4.2.3 ruby 2.1.7p400 (2015-08-18 revision 51632) [i386-mingw32])

## 使い方
1. rails server -b 0.0.0.0
2. ブラウザからhttp://localhost:3000
3. ログイン、パスワードとして、"Taro","p@ssw0rd"と打って管理者でログイン

## その他
- 仮想マシン、物理マシンの管理が可能です。
- 設置場所5か所まで集計できます。データセンターごとに集計することを想定しています。

Copyright Hiroyuki.Mochizuki

