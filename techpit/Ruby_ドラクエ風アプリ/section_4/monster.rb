require './character'

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

    damage = calculate_damage(brave)
    cause_damage(target: brave, damage: damage)

    attack_message(target: brave)
    damage_message(target: brave, damage: damage)
  end

  private

  def transform
    transform_name = "ブルーアイズホワイトドラゴン"

    transform_message(origin_name: @name, transform_name: transform_name)

    @offense *= POWER_UP_RATE
    @name = transform_name
  end
  
  def calculate_damage(target)
    (@offense - target.defense).round
  end

  def cause_damage(**params)
    target = params[:target]
    damage = params[:damage]

    (target.hp -= damage).round
    target.hp = 0 if target.hp < 0

    puts "#{target.name}は#{damage}ポイントのダメージを受けた。"
  end
end
