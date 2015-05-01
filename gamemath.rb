#testing!
#gamemath.rb

@a = 1
@b = 2
@player1life = 3
@player2life = 3

def value_generator
  #prng = random seed

  @a = rand(1..20)
  @b = rand(1..20)

end

def generate_question
  #puts "game version 1 test start"
  puts "What does #{@a} + #{@b} equal?"
end

def prompt_player_for_answer
  print "please enter your answer:"
  user_input = gets.chomp.to_i
  return user_input
end


def verify_answer(user_answer_argument)
 correct_answer = @a + @b
 print "correct answer is #{correct_answer}; "

 if correct_answer == user_answer_argument
  puts "so you got it right!"
  return true
else
  puts "so got it wrong."
  return false
end

end





while @player1life != 0 && @player2life != 0
  puts "DUEL START"
  print "player 1 turn: "
  value_generator
  generate_question
  user_reply = prompt_player_for_answer
  correctness = verify_answer(user_reply)
  if correctness 
  else
    @player1life = @player1life -1 
  end
 


  print "player 2 turn: "
  value_generator
  generate_question
  user_reply = prompt_player_for_answer
  correctness = verify_answer(user_reply)
  if correctness 
  else
    @player2life = @player2life -1 
  end
  puts "DUEL END| P1 HP: #{@player1life}| P2 HP: #{@player2life}  "

end

