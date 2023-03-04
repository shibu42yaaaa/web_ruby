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
    # 攻撃タイプ
    attack_type = decision_attack_type
    # 攻撃ダメージ換算
    damage = calculate_damage(target: monster, attack_type: attack_type)
    # ダメージをHPに反映させる
    cause_damage(target: monster, damage: damage)

    # メッセージ
    puts "#{monster.name}の残りHPは#{monster.hp}ポイントだ。"
  end

  private

  def decision_attack_type
    attack_num = rand(4)
    if attack_num == 0
      puts "必殺攻撃発動"
      puts "滅びのバーストストリーム"
      "special_attack"
    else
      puts "ゾンビアタック"
      "normal_attack"
    end
  end

  def calculate_damage(**params)
    target = params[:target]
    attack_type = params[:attack_type]

    if attack_type == "special_attack"
      culculate_special_attack - target.defense
    else
      @offense - target.defense
    end
  end
  # HPへのダメージ処理を反映
  def cause_damage(**params)
    damage = params[:damage]
    target = params[:target]

    target.hp -= damage
    puts "#{target.name}は#{damage}ポイントのダメージを受けた。"
  end

  def culculate_special_attack
    (@offense * SPECIAL_ATTACK_CONSTANT).round
  end
end

# モンスタークラス
class Monster
  attr_reader :offense, :defense
  attr_accessor :hp, :name

  POWER_UP_RATE = 1.5
  CALC_HALF_HP = 0.5

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]

    # モンスター変身判定フラグ
    @transfrom_flag = false
    # 変身する際のトリガーを計算
    @trigger_of_transform = params[:hp] * CALC_HALF_HP
  end

  def attack(brave)
    # HPが半分以下、かつ、モンスター変身判定フラグがfalseのときに実行
    if @hp <= @trigger_of_transform &&  @transfrom_flag == false
      @transfrom_flag = true
      # 変身メソッド実行
      transform
    end
    
    puts "#{@name}の攻撃"

    damage = (@offense - brave.defense).round
    (brave.hp -= damage).round

    puts "#{brave.name}は#{damage}のダメージを受けた"
    puts "#{brave.name}の残りHPは#{brave.hp}だ"
  end

  private
  
  def transform
    transform_name = "究極完全体ゾンビマン"

    # 変身メッセージ
    puts <<~EOS
    #{@name}は怒っている
    #{@name}は#{transform_name}に進化した。
    EOS

    @offense *= POWER_UP_RATE

    # モンスターの名前変更
    @name = transform_name
  end
end

# インスタンス生成
brave = Brave.new(name:"ヨシヒコ", hp: 500, offense: 150, defense: 100)
monster = Monster.new(name: 'ゾンビマン', hp: 250, offense: 200, defense: 100)

# 実行処理
# 勇者攻撃
brave.attack(monster)

# モンスター攻撃
monster.attack(brave)