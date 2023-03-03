# 勇者クラス
class Brave
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  def attack(monster)
    damage = @offense - monster.defense
    monster.hp -= damage
    
    # メッセージ追加
    puts "#{@name}の攻撃"
    puts "#{monster.name}は#{damage}ポイントのダメージを受けた。"
    puts "#{monster.name}の残りHPは#{monster.hp}ポイントだ。"
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

