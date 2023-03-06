require './character'
require './brave'
require './monster'

brave = Brave.new(name: 'ヨシヒコ', hp: 500, offense: 150, defense: 100)
monster = Monster.new(name: 'ミニリュウ', hp: 250, offense: 200, defense: 100)

loop do
  brave.attack(monster)
  break if monster.hp <= 0

  monster.attack(brave)
  break if brave.hp <= 0
end

battle_result = brave.hp > 0

if battle_result
  exp = (monster.offense + monster.defense) * 2
  gold = (monster.offense + monster.defense) * 3
  puts "#{brave.name}は戦いに勝った。"
  puts "#{exp.round}の経験値と#{gold.round}ゴールドを獲得した。"
else
  puts "#{brave.name}は戦いに敗れた。"
  puts "目の前が真っ暗になった。"
end
