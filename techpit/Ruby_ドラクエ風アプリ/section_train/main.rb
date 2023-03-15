require './brave'
require './monster'
require './games_controller'

games_controller = GamesController.new

brave = Brave.new(name:'ヨシヒコ', hp:300, offense:200, defense:100)
monster = Monster.new(name:'ミニリュー', hp:200, offense:200, defense:100)

EXP_CONSTANT = 2
GOLD_CONSTANT = 3

games_controller.battle(brave: brave, monster: monster)

loop do
  brave.attack(monster)
  break if monster.hp <= o

  monster.attack(brave)
  break if brave.hp <= 0
end

battle_result = brave.hp > 0

if battle_result
  exp = (monster.offense + monster.defense) * EXP_CONSTANT
  gold = (monster.offense + monster.defense) * GOLD_CONSTANT
  puts "#{brave.name}は戦いに勝った"
  puts "#{exp}の経験値と#{gold}ゴールドを獲得した"
else
  puts "#{brave.name}は戦いに負けた"
  puts "目の前が真っ暗になった。"
end