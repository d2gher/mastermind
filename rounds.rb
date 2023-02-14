# frozen_string_literal: false

require_relative './messages'

# Play a round
module Round
  include Message
  def breaker_game(length, max_length)
    colors = (1..max_length).to_a.sample(length)
    prompt_for_guess(length, max_length)

    tries = 12
    loop do
      guess = clean_up(gets.chomp)
      unless valid_guess?(guess, length, max_length)
        prompt_for_guess(length, max_length)
        next
      end
      clues = get_clues(guess, colors)
      print_colors(guess)
      print_clues(clues)
      puts "| Left attempts: #{tries}"

      if correct_guess(guess, colors)
        print_result("You won! Don't get to existed though, today's winner is tomorrow's loser.")
        break
      end

      if tries.zero?
        print_result("You lost. Don't worry, happens to the best of us.")
        break
      end
      tries -= 1
    end
  end
end

# tries = 13
# while tries
#   guess = gets.chomp
#   guess = clean_up(guess)
#   break if correct_guess(guess, colors)

#   

#   unless valid_guess?(guess, length, max_num)
#     print error
#     next
#   end
#   
  #  if valid_guess?(guess, length, max_num)
  
# end
