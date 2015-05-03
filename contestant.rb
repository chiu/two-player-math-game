#player.rb

class Contestant


  def initialize(id, name, hp, score)
    @id = id
    @name = name
    @hp = hp
    @score = score
  end
  
  public    # This method can be called from outside the class.

  def reset
    @hp = 3
    @score = 0

  end

  def hp
    @hp
  end

  def name=(name)
    @name = name
  end

  def score
    @score
  end

  
  def gain_score
    #@score = @score + 1
    @score += 1
  end


  def lose_life 
    @hp = @hp - 1
  end


  def print_info
    puts "id: #{@id}, name: #{@name}, hp: #{@hp}, score: #{@score}"

  end

   def player_status
    return "id: #{@id}, name: #{@name}, hp: #{@hp}, score: #{@score}"

  end

  def say_hi
    puts "I am alive, hi."

  end


  private   # This method can't!
  
  def bank_account_number
    @account_number = 12345
    puts "My bank account number is #{@account_number}."
  end


end