require_relative './output'
require_relative './messages'
require_relative './guess'

include Output
include Message
include Guess

length = 4
max_num = 6

colors = [1, 2, 3, 4, 5, 6].sample(4)

puts welcome
tries = 13
while tries
  guess = gets.chomp
  guess = clean_up(guess)
  break if correct_guess(guess, colors)

  clues = get_clues(guess, colors)

  unless valid_guess?(guess, length, max_num)
    print error
    next
  end
  tries -= 1
  print_colors(guess) if valid_guess?(guess, length, max_num)
  print_clues(clues)
  puts "| Left attempts: #{tries}"
end
