#testing!
#gamemath.rb

require 'colorize'

puts "I am now red.".red
puts "I am now blue.".green
puts "I am a super coder".yellow

@first_number = 1
@second_number = 2
@operator = '+'
@player_data = [
	{name: "Player 1", hp: 3, score: 0,},
	{name: "Player 2", hp: 3,	score: 0,}
]

def populate_game
	@first_number = 1
	@second_number = 2
	@operator = '+'
	@player_data = [
		{name: "Player 1", hp: 3, score: 0,},
		{name: "Player 2", hp: 3,	score: 0,}
	]
end

def reset_game
	@first_number = 1
	@second_number = 2
	@operator = '+'
	@player_data.each { |player|
		player[:hp] = 3
		player[:score] = 0 
	}
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

def one_turn(player_number)
	print "#{@player_data[player_number][:name]} turn: "
	randomize_operator
	randomize_value
	puts generate_question
	user_reply = prompt_player_for_answer
	#player loses health when they get answer wrong
	@player_data[player_number][:hp] -= 1 unless verify_answer(user_reply)
	#player increments score by 1 if right
	@player_data[player_number][:score] += 1 if verify_answer(user_reply)
	#if good result prints in green otherwise red
	puts verify_answer(user_reply) ? string_status_message(player_number).green : string_status_message(player_number).red
end

def string_status_message(player_number)
	"#{@player_data[player_number][:name]} | HP: #{@player_data[player_number][:hp]} | score: #{@player_data[player_number][:score]}"
end

def game_continue?
	@player_data[0][:hp] != 0 && @player_data[1][:hp] !=0 
end

def one_battle
	duel_counter = 2
	while game_continue? 
		duel_counter % 2 == 0 ? one_turn(0) : one_turn(1)
		duel_counter += 1
	end
end

def output_endgame_message
	if @player_data[0][:score] > @player_data[1][:score]
		return "Player 1 wins with score #{@player_data[0][:score]}"
	else
		return "Player 2 wins with score #{@player_data[1][:score]}"
	end
end

def output_startgame_message
	puts "welcome"
	print "enter player one name: " 
	@player_data[0][:name] = gets.chomp
	print "enter player two name: " 
	@player_data[1][:name] = gets.chomp
end


puts "version 3 test"
def one_war
	playflag = true
	first_game = true
	while playflag == true
		reset_game
		puts output_startgame_message if first_game == true
		one_battle
		puts output_endgame_message
		print "Do you wish to play the game again? (y/n): "
		user_input = gets.chomp.downcase
		playflag = (user_input == 'y') ? true : false
		first_game = false
	end
end

#play game
one_war

