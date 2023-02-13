# frozen_string_literal: false

# Class for the guesses
module Guess
  def clean_up(guess)
    guess = guess.gsub(/\s+/, '')
    guess = guess.split('')
    guess.map!(&:to_i)
  end

  def valid_guess?(guess, length, max_num)
    return false unless guess.length == length
    return false unless guess.all? { |num| (num.positive? && num <= max_num) }

    true
  end

  def get_clues(guess, answer)
    guess.map.with_index do |num, index|
      clue_weakness = 2
      clue_weakness = 1 if answer.include?(num)
      clue_weakness = 0 if num == answer[index]
      clue_weakness
    end
  end

  def correct_guess(guess, answer)
    return true if answer.sort == guess.sort

    false
  end
end
