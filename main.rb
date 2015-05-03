#main.rb

require 'colorize'
require_relative '10gamemath'
require_relative 'player'
require_relative 'game'



puts "I am now red.".red
puts "I am now blue.".green
puts "I am a super coder".yellow
puts "Hello."



@first_number = 1
@second_number = 2
@operator = '+'
@player_data = [
  {name: "Player 1", hp: 3, score: 0,},
  {name: "Player 2", hp: 3, score: 0,}
]

#play game
one_war