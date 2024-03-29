class GamesController
  EXP_CONSTANT = 2
  GOLD_CONSTANT = 3
  
  def battle(**params)
    # brave = params[:brave]
    # monster = params[:monster]
    build_characters(params)
    
  
  
    loop do
      @brave.attack(@monster)
      break if battle_end?
      @monster.attack(@brave)
      break if battle_end?
    end

    battle_judgment
    
    
    # if battle_result
    # #   exp = (monster.offense + monster.defense) * EXP_CONSTANT
    # #   gold = (monster.offense + monster.defense) * GOLD_CONSTANT
    #   result = calculate_of_exp_gold
    #   puts "#{@brave.name}は戦いに勝った。"
    #   puts "#{result[:exp].round}の経験値と#{result[:gold].round}ゴールドを獲得した。"
    # else
    #   puts "#{@brave.name}は戦いに負けた。"
    #   puts "目の前が真っ暗になった。"
    # end
  end

  private
  
  def build_characters(**params)
    @brave = params[:brave]
    @monster = params[:monster]
  end

  def battle_end?
    # character.hp <= 0
    @brave.hp <= 0 || @monster.hp <= 0
  end

  def brave_win?
    @brave.hp > 0
  end

  def battle_judgment
    if brave_win?
      result = calculate_of_exp_gold
      puts "#{@brave.name}は戦いに勝った。"
      puts "#{result[:exp].round}の経験値と#{result[:gold].round}ゴールドを獲得した。"
    else
      puts "#{@brave.name}は戦いに負けた。"
      puts "目の前が真っ暗になった。"
    end
  end

  def calculate_of_exp_gold
    exp = (@monster.offense + @monster.defense) * EXP_CONSTANT
    gold = (@monster.offense + @monster.defense) * GOLD_CONSTANT
    result = {exp: exp, gold: gold}

    result
  end
end
