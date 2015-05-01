#testing!
#gamemath.rb

@a = 1
@b = 2

def value_generator
  #prng = random seed
  prng = Random.new
  @a = prng.rand(1..20)
  @b = prng.rand(1..20)

end

def generate_question
  puts "game version 1 test start"
  puts "Player:  What does #{@a} + #{@b} equal?"
end

def prompt_player_for_answer
  puts "please enter your answer:"
  user_input = gets.chomp.to_i
  return user_input
end


def verify_answer(user_answer_argument)
   correct_answer = @a + @b
   puts "correct answer is #{correct_answer}"

  if correct_answer == user_answer_argument
    puts "You got it right!"
    return true
  else
    puts "You got it wrong."
    return false
  end

end


value_generator
generate_question
user_reply = prompt_player_for_answer
verify_answer(user_reply)


