# 勇者クラス
class Brave
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  # 必殺技
  SPECIAL_ATTACK_CONSTANT = 1.5

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  def attack(monster)
    puts "#{@name}の攻撃"

    # 0~3の間でランダム数値
    attack_num = rand(4)

    # 4分の1の確率でspecial_attackを実行
    if attack_num == 0
      puts "必殺技"
      damage = culculate_special_attack - monster.defense
    else
      puts "通常攻撃"
      damage = @offense - monster.defense
    end

    monster.hp -= damage
    
    # メッセージ追加
    puts "#{monster.name}は#{damage}ポイントのダメージを受けた。"
    puts "#{monster.name}の残りHPは#{monster.hp}ポイントだ。"
  end

  def culculate_special_attack
    (@offense * SPECIAL_ATTACK_CONSTANT).round
  end
end

# モンスタークラス
class Monster
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
end

# インスタンス生成
brave = Brave.new(name:"ヨシヒコ", hp: 500, offense: 150, defense: 100)
monster = Monster.new(name: 'ゾンビマン', hp: 250, offense: 200, defense: 100)

# 実行処理
brave.attack(monster)

