require './character'

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
