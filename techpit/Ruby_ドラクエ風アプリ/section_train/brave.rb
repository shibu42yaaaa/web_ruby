require './character'

class Brave < Characrer
  SPECIAL_ATTACK_CONSTANT = 1.5
  
  def attack(monster)
    puts "#{@name}の攻撃"

    attack_type = dicision_attack_type

    damage = calculate_damage(target: monster, attack_type: attack_type)

    cause_damage(target: monster, damage: damage)
    
  end

  private

  def attack_type
    attack_num = rand(4)

    if attack_num == 0
      puts "必殺技発動"
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
      calculate_special_attack - target.defense
    else
      @offense - target.defense
    end
  end

  def cause_damage(**params)
    target = params[:target]
    damage = params[:damage]

    target.hp -= damage
    puts "#{target.name}は#{damage}ポイントのダメージを受けた"
  end

  def calculate_special_attack
    (@offense * SPECIAL_ATTACK_CONSTANT).round
  end
end
