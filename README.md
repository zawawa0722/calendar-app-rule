## アプリ名

calendar-app-rule

## 概要

生活のデータを細かく把握できるよう、カレンダーと家計簿をリンクさせています。"予定の追加"をクリックし、予定とその予定に使用する金額の情報を入力するとその月の家計簿をグラフで確認することができます。
※現在予定の編集機能が未実装のため、消費額が事前情報でしか入力できない状態です。

## 制作背景

日常的にカレンダーアプリと家計簿アプリをよく使うため、アプリを逐一切り替えずにそれらの情報を把握することができれば、より手間なく生活の見直しや改善のデータが得られるのではと思いこのアプリを制作しています。カレンダーと家計簿はそれら単体でも十分に便利ですが、それぞれのデータを紐付けることでより生活情報を集約したいと考えたからです。

## DEMO

[![Image from Gyazo](https://i.gyazo.com/180732dd7e417479f4548e6a822ab61c.gif)](https://gyazo.com/180732dd7e417479f4548e6a822ab61c)

## 実装予定の内容

- マップ機能
- メモ機能
- 予定の編集・削除機能

## カレンダー画面

[![Image from Gyazo](https://i.gyazo.com/f9d7a83b69856baa32372deff94693c9.gif)](https://gyazo.com/f9d7a83b69856baa32372deff94693c9)

jqueryのプラグイン"fullcalendar"を使って実装しています。

## 今月の支出情報

[![Image from Gyazo](https://i.gyazo.com/5305d85144ad8529b7e2d73ce52c3861.gif)](https://gyazo.com/5305d85144ad8529b7e2d73ce52c3861)

chart.js使用。
今月の使用合計金額とそのグラフを実装しました。

## 年間の支出額の表示

[![Image from Gyazo](https://i.gyazo.com/99a6d7f815dc148787570afe46e53b7d.gif)](https://gyazo.com/99a6d7f815dc148787570afe46e53b7d)

chart.js使用
配列の情報を取得し、その数値をグラフ表示することによって年間の支出額を表示しています。

## 使用技術（開発環境）

## フロントエンド
HTML,Sass,javascripst,jquery,ajax

## バックエンド
Ruby,Ruby on Rails

## DB
PostgreSQL

## エディタ
VScode

## ソース管理
Github
