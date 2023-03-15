require './character'

class Monster < Characrer
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
    @trigger_of_transform = params[:hp] * CALC_HALF_HP
  end

  def attack(brave)
    if @hp < @trigger_of_transform && @transfrom_flag == false
        @transfrom_flag = true
        transform
    end
    puts "#{@name}の攻撃"

    damage = calculate_damage(brave)
    cause_damage(target: brave, damage: damage)

    puts "#{brave.name}は#{damage}ポイントのダメージを受けた"
    puts "#{brave.name}の残りHPは#{brave.hp}だ"
  end

  private

  def calculate_damage(target)
    @offense - target.defense
  end

  def cause_damage(**params)
    target = params[:target]
    damage = params[:damage]

    target.hp -= damage
    puts "#{target.name}は#{damage}のダメージを受けた"
  end

  def transform
    transform_name = "ドラゴン"

    puts <<~EOS
    #{@name}は怒っている
    #{@name}は#{transform_name}に進化した。
    EOS

    @name = transform_name
    @offense *= POWER_UP_RATE
  end
end
