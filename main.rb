require_relative './output'
require_relative './messages'
require_relative './guess'
require_relative './string'
require_relative './rounds'

include Output
include Message
include Guess
include Round

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

  play_another_round?
  break unless %w[y yes].include?(gets.chomp.downcase)
end
