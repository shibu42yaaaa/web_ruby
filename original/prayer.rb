# 名前の入力
puts "名前を入力してください。"
prayer_name = gets.chomp
# ポジションの入力
positions = [
    {pos_name: '投手'},
    {pos_name: '捕手'},
    {pos_name: '一塁手'},
    {pos_name: '二塁手'},
    {pos_name: '三塁手'},
    {pos_name: '遊撃手'},
    {pos_name: '外野'},
]
# ポジション表示
print = "ポジションを選択(番号)"
puts " "
positions.each.with_index(1) do |pn, i|
  puts "#{i}.#{pn[:pos_name]}"
end

# ポジションの選択
selected_position_num = gets.to_i
chosen_position = positions[selected_position_num - 1]
# 投打選択
styles = [
    {throw: '右投げ', hit: '右打ち'},
    {throw: '右投げ', hit: '左打ち'},
    {throw: '右投げ', hit: '両打ち'},
    {throw: '左投げ', hit: '右打ち'},
    {throw: '左投げ', hit: '左打ち'},
    {throw: '左投げ', hit: '両打ち'},
]

puts "投打のスタイルを選択してください。"
# 投打スタイルを表示
styles.each.with_index(1) do |style, i|
  puts "#{i}.#{style[:throw]}#{style[:hit]}"
end

# 投打スタイルの選択
select_style_num = gets.to_i
# 選択した番号とstyleの番号を一致させる
chosen_style = styles[select_style_num - 1]

# 高校選択
puts "高校を選択してください。"
schools = [
    {name: '箱根学園'},
    {name: '湘南海浜高校'},
    {name: '相模原明海工業高校'},
    {name: '横浜秀岳館高校'},
    {name: '慶成高校'},
    {name: '藤沢透明館高校'},
    {name: 'みなとみらい総合科学高校'},
]
# 高校を表示
schools.each.with_index(1) do |sc, i|
  puts "#{i}.#{sc[:name]}"
end
select_school_num = gets.to_i
# 選択した番号とschoolsの番号を一致させる
chosen_school = schools[select_school_num - 1]

# 希望球団選択
puts "希望球団を選択してください。"
teams = [
    {name: '東京ヤクルトスワローズ'},
    {name: '横浜DeNAベイスターズ'},
    {name: '阪神タイガース'},
    {name: '東京読売ジャイアンツ'},
    {name: '広島東洋カープ'},
    {name: '中日ドラゴンズ'},
    {name: 'オリックス・バファローズ'},
    {name: '福岡ソフトバンクホークス'},
    {name: '埼玉西武ライオンズ'},
    {name: '東北楽天ゴールデンイーグルス'},
    {name: '千葉ロッテマリーンズ'},
    {name: '北海道日本ハムファイターズ'}
]
# 希望球団を表示
teams.each.with_index(1) do |team, i|
  puts "#{i}.#{team[:name]}"
end
select_team_num = gets.to_i
# 選択した番号とteamsの番号を一致させる
chosen_team = teams[select_team_num - 1]


p "-----------------------------"
p "以上で終了です。入力された結果はこちらです。"
p "ポジション:#{chosen_position[:pos_name]}"
p "投打スタイル:#{chosen_style[:throw]}#{chosen_style[:hit]}"
p "所属高校:#{chosen_school[:name]}"
p "希望球団:#{chosen_team[:name]}"