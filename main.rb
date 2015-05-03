#main.rb
require 'colorize'
require_relative 'contestant'
require_relative 'game'

puts "I am now red.".red
puts "I am now blue.".green
puts "I am a super coder".yellow
puts "Hello."

@first_number = 1
@second_number = 2
@operator = '+'

contestant_roster = populate_game
one_war(contestant_roster)
