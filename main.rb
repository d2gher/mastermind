# frozen_string_literal: false

require_relative './messages'
require_relative './string'
require_relative './rounds'

include Message

welcome_message

loop do
  include Round
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
    break if length.positive? && length < 8
  end
  max_length = length + 2

  breaker_game(length, max_length) if game_mode == 1
  maker_game(length, max_length) if game_mode == 2

  play_another_round?
  break unless %w[y yes].include?(gets.chomp.downcase)
end
