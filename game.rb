require_relative 'contestant'
require 'colorize'

def one_turn(contestant_number, contestant_roster)
 current_contestant = contestant_roster[contestant_number]
 randomize_operator
 randomize_value
 puts generate_question
 user_reply = prompt_player_for_answer
  # # #player loses health when they get answer wrong
  current_contestant.lose_life unless verify_answer(user_reply)
  # # #player increments score by 1 if right
  current_contestant.gain_score if verify_answer(user_reply)
  # # #if good result prints in green otherwise red
  puts verify_answer(user_reply) ? current_contestant.player_status.green : current_contestant.player_status.red
end

def populate_game
  @first_number = 1
  @second_number = 2
  @operator = '+'
  contestant_1 = Contestant.new(0, 'Alpha guy', 3, 0)
  contestant_2 = Contestant.new(1, 'Beta guy', 3, 0)
  @player_data = [contestant_1, contestant_2]
  return @player_data 
end

def randomize_operator
  some_random_number = rand(1..4)
  case some_random_number
  when 1
    @operator = '+'
  when 2
    @operator = '-'
  when 3
    @operator = '*'
  else
    @operator = '/'
  end
end

def randomize_value 
  @first_number = rand(1..5)
  @second_number = rand(1..5)
end

def generate_question
  "What does #{@first_number} #{@operator.to_s} #{@second_number} equal?"
end

def prompt_player_for_answer
  print "Enter your answer: "
  user_input = gets.chomp.to_i
end

def verify_answer(user_answer)
  case @operator
  when '+'
    correct_answer = @first_number + @second_number
  when '-'
    correct_answer = @first_number - @second_number
  when '*'
    correct_answer = @first_number * @second_number
  when '/'
    correct_answer = @first_number / @second_number
  end
  if correct_answer == user_answer
    #puts "so you got it right!"
    return true
  else
    #puts "so got it wrong."
    return false
  end
end

def game_continue?(contestant_roster)
  contestant_roster[0].hp != 0 && contestant_roster[1].hp !=0 
end

def one_battle(contestant_roster)
  duel_counter = 2
  while game_continue?(contestant_roster)
    duel_counter % 2 == 0 ? one_turn(0, contestant_roster) : one_turn(1, contestant_roster)
    duel_counter += 1
  end
end

def reset_game(contestant_roster)
  @first_number = 1
  @second_number = 2
  @operator = '+'
  contestant_roster.each { |contestant|
    contestant.reset
  }
end

def output_startgame_message(contestant_roster)
  puts "welcome"
  print "enter player one name: " 
  contestant_roster[0].name = gets.chomp
  print "enter player two name: " 
  contestant_roster[1].name = gets.chomp
end

def output_endgame_message(contestant_roster)
  if contestant_roster[0].score > contestant_roster[1].score
    return "Player 1 wins with score #{contestant_roster[0].score}"
  else
    return "Player 2 wins with score #{contestant_roster[1].score}"
  end
end

def one_war(contestant_roster)
  playflag = true
  first_game = true
  while playflag == true
   reset_game(contestant_roster)
   puts output_startgame_message(contestant_roster) if first_game == true
   one_battle(contestant_roster)
   puts output_endgame_message(contestant_roster)
   print "Do you wish to play the game again? (y/n): "
   user_input = gets.chomp.downcase
   playflag = (user_input == 'y') ? true : false
   first_game = false
 end
end

