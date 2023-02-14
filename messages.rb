# frozen_string_literal: false

require_relative './output'

# Module messages for the player
module Message
  include Output

  def welcome_message
    puts "
#{'MASTERMIND'.bold.underline}

The object of Mastermind is to guess a secret code consisting of a series of n
colored pegs. Each guess results in clues narrowing down the possibilities of the code.
The player wins when they guess the correct sequance of code in the 12 tries they have.

#{'Clues:'.bold}
 _______________________________________________________
|                                                       |
| #{circle(0)} | A color is in the code and right position         |
| #{circle(1)} | A Color is in the code but not the right position |
| #{circle(2)} | A color is not in the code at all                 |
|_______________________________________________________|

"
  end

  def maker_or_breaker?
    puts '
Enter 1 to play as the CODE-BREAKER
Enter 2 to play as the CODE-MAKER'
  end

  def prompt_for_length
    puts 'How long do you want the code to be? Enter a number between 1 and 11.'
  end

  def prompt_for_guess(length, max_length)
    puts "Enter your guess. #{length} numbers between 1 and #{max_length + 1}"
  end

  def print_result(result)
    sleep 1
    puts "\n#{'-' * result.length}"
    sleep 1
    puts result
    sleep 1
    puts "#{'-' * result.length}\n"
    sleep 1
  end

  def play_another_round?
    puts "\nDo you want to play another round? Enter y or yes."
  end
end
