#!/home/toshio/.rbenv/shims/ruby

# 日報テンプレスクリプトのRuby版
# それほど難しくないと思っていたが、
# 実際難しくなかった

require "date"

date = Date.today
days = ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"]

puts("")
puts("# 日々の記録 " + date.year.to_s + "年" + date.month.to_s + "月分")
puts("")
puts("## " + date.year.to_s + "年" + date.month.to_s + "月" + date.day.to_s + "日（" + days[date.wday] + "）")

puts("### 今日の目標")
puts("")
puts("")
puts("### 把握している他の人の予定")
puts("")
puts("")
puts("### 今日の行動予定")
puts("")
puts("")
puts("### 今日の行動")
puts("")
puts("")
puts("### まとめ")
puts("")
puts("")
puts("以上")
