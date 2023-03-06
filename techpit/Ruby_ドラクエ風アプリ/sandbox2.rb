class Characrer
  attr_reader :offense, :defense
  attr_accessor :name, :hp  
  
  def initialize(**params)
      @name = params[:name]
      @hp = params[:hp]
      @offense = params[:offense]
      @defense = params[:defense]
  end
end

class Brave < Characrer
  
  def attack(monster)
    puts "#{@name}の攻撃"

    damage = calculate_damage(monster)
    cause_damage(monster, damage)

    puts "#{monster.name}の残りHPは#{monster.hp}だ。"
  end

  private

  def calculate_damage(monster)
    @offense - monster.defense
  end

  def cause_damage(monster, damage)
    monster.hp -= damage
    monster.hp = 0 if monster.hp < 0

    puts "#{monster.name}は#{damage}ポイントのダメージを受けた。"
  end
end

class Monster < Characrer

  #   def initialize(**params)
#     super(
#         name: params[:name],
#         hp: params[:hp],
#         offense: params[:offense],
#         defense: params[:defense],
#     )
#   end

  def attack(brave)
    puts "#{@name}の攻撃"

    damage = calculate_damage(brave)
    cause_damage(brave, damage)

    puts "#{brave.name}の残りHPは#{brave.hp}だ。"
  end

  private

  def calculate_damage(brave)
    @offense - brave.defense
  end

  def cause_damage(brave, damage)
    brave.hp -= damage
    brave.hp = 0 if brave.hp < 0

    puts "#{brave.name}は#{damage}ポイントのダメージを受けた。"
  end
end

brave = Brave.new(name: 'ヨシヒコ', hp: 500, offense: 150, defense: 100)
monster = Monster.new(name: 'ミニリュウ', hp: 250, offense: 200, defense: 100)

loop do
  brave.attack(monster)
  break if monster.hp <= 0

  monster.attack(brave)
  break if brave.hp <= 0
end
