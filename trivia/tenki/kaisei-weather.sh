#!/usr/bin/bash

# ウェザーニュースの今日明日の天気の部分だけ標準出力する

workdir=~/myenv/bin
cd $workdir

lynx -dump https://weathernews.jp/onebox/tenki/kanagawa/14366/ | head -n 190 | tail -n 35 | sed -f tenki_icon.sed
