require './brave'
require './monster'
require './games_controller'

games_controller = GamesController.new


brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)
monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)

games_controller.battle(brave: brave, monster: monster)

# EXP_CONSTANT = 2
# GOLD_CONSTANT = 3

# def battle(**params)
  
# end

# loop do
#   brave.attack(monster)
#   break if monster.hp <= 0
#   monster.attack(brave)
#   break if brave.hp <= 0
# end

# battle_result = brave.hp > 0

# if battle_result
#   exp = (monster.offense + monster.defense) * EXP_CONSTANT
#   gold = (monster.offense + monster.defense) * GOLD_CONSTANT
#   puts "#{brave.name}は戦いに勝った。"
#   puts "#{exp.round}の経験値と#{gold.round}ゴールドを獲得した。"
# else
#   puts "#{brave.name}は戦いに負けた。"
#   puts "目の前が真っ暗になった。"
# end
