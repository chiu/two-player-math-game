#player.rb

class Player


  def initialize(id, name, hp, score)
    @name = name
    @hp = hp
    @score = score
  end
  
  public    # This method can be called from outside the class.

  def gain_point
    @score += @score
  end


  def lose_life 
    @hp -= @hp
  end


  


  private   # This method can't!
  
  def bank_account_number
    @account_number = 12345
    puts "My bank account number is #{@account_number}."
  end


end