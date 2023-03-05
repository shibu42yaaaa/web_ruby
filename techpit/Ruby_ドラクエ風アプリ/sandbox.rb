class Character
  attr_reader :offense, :defense
  attr_accessor :name, :hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
end

# braveくらす
class Brave < Character
  SPECIAL_ATTACK_CONSTANT = 1.5

  def attack(monster)
    puts "#{@name}の攻撃"

    attack_type = dicision_attack_type
    damage = calculate_damage(target: monster, attack_type:attack_type)
    cause_damage(target: monster, damage: damage)

    puts "#{monster.name}の残りHPは#{monster.hp}だ"
  end

  private

  def dicision_attack_type
    attack_num = rand(4)

    if attack_num == 0
      puts "必殺攻撃"
      "special_attack"
    else
      puts "通常攻撃"
      "normal_attack"
    end
  end

  def calculate_damage(**params)
    target = params[:target]
    attack_type = params[:attack_type]

    if attack_type == "special_attack"
      (calculate_special_attack - target.defense).round
    else
      (@offense - target.defense).round
    end
  end
  # 必殺攻撃
  def calculate_special_attack
    (@offense * SPECIAL_ATTACK_CONSTANT).round
  end

  def cause_damage(**params)
    target = params[:target]
    damage = params[:damage]
  
    # モンスター(target)のHP - damage
    (target.hp -= damage).round
    target.hp = 0 if target.hp < 0

    puts "#{target.name}は#{damage}を受けた。"
  end
end

# monsterクラス
class Monster < Character

  CALC_HALF_HP = 0.5
  POWER_UP_RATE = 1.5

  def initialize(**params)
    super(
      name: params[:name],
      hp: params[:hp],
      offense: params[:offense],
      defense: params[:defense]
    )

    @transfrom_flag = false
    @trigger_of_transform = params[:hp]*CALC_HALF_HP
  end

  def attack(brave)
    if @hp < @trigger_of_transform && @transfrom_flag == false
      @transfrom_flag = true
      transform
    end

    puts "#{@name}の攻撃"

    # monster -> brave
    damage = calculate_damage(brave)
    cause_damage(brave, damage)

    puts "#{brave.name}の残りHPは#{brave.hp}だ"
  end

  private

  def transform
    transform_name = "ブルーアイズホワイトドラゴン"

    puts <<~EOS
    #{@name}は怒っている
    #{@name}は#{transform_name}に変身した。
    EOS

    @offense *= POWER_UP_RATE
    @name = transform_name
  end
  
  def calculate_damage(brave)
    (@offense - brave.defense).round
  end

  def cause_damage(brave, damage)
    (brave.hp -= damage).round
    brave.hp = 0 if brave.hp < 0

    puts "#{brave.name}は#{damage}ポイントのダメージを受けた。"
  end

end

brave = Brave.new(name: 'ヨシヒコ', hp: 500, offense: 150, defense: 100)
monster = Monster.new(name: 'ミニリュウ', hp: 250, offense: 200, defense: 100)

loop do
  brave.attack(monster)
  break if monster.hp >= 0

  monster.attack(brave)
  break if brave.hp <= 0
end

