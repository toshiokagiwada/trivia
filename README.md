# triviaについて

個人的に必要で書いたスクリプトを集めたリポジトリです。
ハッキリ言って、大したものではありません。

# 各スクリプトの説明

```
trivia/tenki/kaisei-weather.sh
trivia/tenki/tenki_icon.sed
```

ウェザーニューズさまの天気予報のページを取得して、
自分の必要なところだけ標準出力するスクリプトです。
tenki_icon.sedでアイコンのお天気コードの様なものを
日本語の天気予報に変換しています。

lynxとsedがインストールされているかはご確認ください。

なお、出力が少しズレたりすることがありますが、
あくまで個人使用のものなので、目をつぶってください。

```
trivia/cheat_emacs.sh
```

ホームディレクトリ配下にある、
png形式のemacsチートシート（使い方早見表）を表示するスクリプトです。
いつも参照する画像ファイルを開くのに応用はできそうですが…

```
trivia/emacsnw.sh
```

emacsをターミナルで開きたい時のためのスクリプトです。
単純に-nwオプションと引数をひとつ渡しているだけです。

```
trivia/nippo.py
trivia/nippo.rb
```

日報のテンプレを日付付きで標準出力するスクリプトです。
python版とruby版がありますが、大した違いはないです。

```
trivia/del-nyoro.sh
```

emacsを使っていると現れる、チルダ付きファイルを削除するスクリプトです。
コマンドの打ち間違いで必要なファイルを消さないために使っています。

# ご連絡について

あまり詳しくはないのですが、
githubのサービス内でご連絡いただけると、
おそらく対応できるかと思います。
