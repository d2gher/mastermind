# frozen_string_literal: false

require_relative './guess'
require_relative './messages'

# Play a round
module Round
  include Message
  include Guess

  def breaker_game(length, max_length)
    colors = (1..max_length).to_a.sample(length)
    prompt_for_guess(length, max_length)

    tries = 11
    loop do
      guess = clean_up(gets.chomp)
      unless valid_guess?(guess, length, max_length)
        prompt_for_guess(length, max_length)
        next
      end
      clues = get_clues(guess, colors)
      remove_a_line
      print_colors(guess)
      print_clues(clues)
      puts "| Left attempts: #{tries}"

      if correct_guess(guess, colors)
        print_result("You won! Don't get too excited though, today's winner is tomorrow's loser.")
        break
      end
      if tries.zero?
        print_result("You lost. Don't worry, happens to the best of us.")
        break
      end
      tries -= 1
    end
  end

  def maker_game(length, max_length)
    colors = []
    loop do
      prompt_for_colors(length, max_length)
      colors = gets.chomp
      break if valid_code(colors, length, max_length)
    end
    colors = colors.gsub(/\s+/, '').split('').map(&:to_i)
    guess = (1..max_length).to_a.sample(length)
    possiable_colors = (1..max_length).to_a - guess

    tries = 11
    loop do
      sleep 1
      clues = get_clues(guess, colors)
      print_colors(guess)
      print_clues(clues)
      puts "| Left attempts: #{tries}"

      if correct_guess(guess, colors)
        print_result('The computer has won! Humanity is dooomed.')
        break
      end
      if tries.zero?
        print_result('The computer has lost. Take that AI!')
        break
      end
      tries -= 1

      guess = guess.map.with_index do |color, _index|
        unless colors.include?(color) || possiable_colors.empty?
          possiable_colors.slice!(-1)
        else
          color
        end
      end

      guess.each.with_index do |color, index|
        unless color == colors[index]
          wrong_guess = guess.slice!(index..-1).shuffle
          guess += wrong_guess
          break
        end
      end
    end
  end
end
