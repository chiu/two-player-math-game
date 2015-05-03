require_relative 'contestant'
require 'colorize'

def one_turn(contestant_number, contestant_roster)

 current_contestant = contestant_roster[contestant_number]
 #puts current_contestant.inspect
 current_contestant.say_hi
 randomize_operator
 randomize_value
 puts generate_question
 user_reply = prompt_player_for_answer

 #current_contestant.print_info
    
  # # #player loses health when they get answer wrong
  current_contestant.lose_life unless verify_answer(user_reply)
  # # #player increments score by 1 if right
  current_contestant.gain_score if verify_answer(user_reply)
  # # #if good result prints in green otherwise red
  #current_contestant.print_info
  puts verify_answer(user_reply) ? current_contestant.player_status.green : current_contestant.player_status.red
end



def populate_game
  @first_number = 1
  @second_number = 2
  @operator = '+'
  contestant_1 = Contestant.new(0, 'Alpha guy', 3, 0)
  contestant_2 = Contestant.new(1, 'Beta guy', 3, 0)
  @player_data = [contestant_1, contestant_2]
  #puts @player_data.inspect
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
  #puts "game version 1 test start"
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
  #print "correct answer is #{correct_answer}; "
  if correct_answer == user_answer
    #puts "so you got it right!"
    return true
  else
    #puts "so got it wrong."
    return false
  end
end




# def string_status_message(player_number)
#   "#{@player_data[player_number][:name]} | HP: #{@player_data[player_number][:hp]} | score: #{@player_data[player_number][:score]}"
# end

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



# #game.rb
# def reset_game
#   @first_number = 1
#   @second_number = 2
#   @operator = '+'
#   @player_data.each { |player|
#     player[:hp] = 3
#     player[:score] = 0 
#   }
# end


# def output_startgame_message
#   puts "welcome"
#   print "enter player one name: " 
#   @player_data[0][:name] = gets.chomp
#   print "enter player two name: " 
#   @player_data[1][:name] = gets.chomp
# end

# def output_endgame_message
#   if @player_data[0][:score] > @player_data[1][:score]
#     return "Player 1 wins with score #{@player_data[0][:score]}"
#   else
#     return "Player 2 wins with score #{@player_data[1][:score]}"
#   end
# end




# def one_war
#   playflag = true
#   first_game = true
#   while playflag == true
#     reset_game
#     puts output_startgame_message if first_game == true
#     one_battle
#     puts output_endgame_message
#     print "Do you wish to play the game again? (y/n): "
#     user_input = gets.chomp.downcase
#     playflag = (user_input == 'y') ? true : false
#     first_game = false
#   end
# end

