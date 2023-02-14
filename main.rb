require_relative './output'
require_relative './messages'
require_relative './guess'
require_relative './string'

include Output
include Message
include Guess

welcome_message

loop do
  game_mode = 0
  loop do
    maker_or_breaker?
    game_mode = gets.chomp.to_i
    break if [1, 2].include?(game_mode)
  end

  length = 0
  loop do
    prompt_for_length
    length = gets.chomp.to_i
    break if length > 1 && length < 11
  end
  max_length = length + 2

  breaker_game(length, max_length) if game_mode == 1
  maker_game(length, max_length) if game_mode == 2
end

# tries = 13
# while tries
#   guess = gets.chomp
#   guess = clean_up(guess)
#   break if correct_guess(guess, colors)

#   clues = get_clues(guess, colors)

#   unless valid_guess?(guess, length, max_num)
#     print error
#     next
#   end
#   tries -= 1
#   print_colors(guess) if valid_guess?(guess, length, max_num)
#   print_clues(clues)
#   puts "| Left attempts: #{tries}"
# end
