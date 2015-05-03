#main.rb

require 'colorize'
#require_relative '10gamemath'
require_relative 'contestant'
require_relative 'game'



puts "I am now red.".red
puts "I am now blue.".green
puts "I am a super coder".yellow
puts "Hello."



@first_number = 1
@second_number = 2
@operator = '+'

# puts some_guy = Contestant.new(4,"jack", 3, 0)
# some_guy.print_info

contestant_roster = populate_game
#puts contestant_roster
# puts "presenting first guy"
# puts contestant_a = contestant_roster[0]
# puts "presenting second guy "
# puts contestant_b = contestant_roster[1]



#one_turn(0, contestant_roster)
one_battle(contestant_roster)
