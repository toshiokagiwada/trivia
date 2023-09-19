#!/home/toshio/.pyenv/shims/python

# 日々の記録（日報？）のテンプレを出力する

import datetime
import locale
locale.setlocale(locale.LC_TIME, 'ja_JP.UTF-8')

dt_now = datetime.datetime.now()

print("")
print(dt_now.strftime('# 日々の記録 %Y年%m月分'))
print("")
print(dt_now.strftime('## %Y年%m月%d日（%A）'))

print("### 今日の天気")
print("")
print("")
print("")

print("### 今日の目標")
print("")
print("")
print("")

print("### 把握している他の人の予定")
print("")
print("")
print("")

print("### 今日の行動予定")
print("")
print("")
print("")

print("### 今日の行動")
print("")
print("")
print("")

print("### まとめ")
print("")
print("")
print("")

print("以上")

