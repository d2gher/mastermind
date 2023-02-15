# frozen_string_literal: false

# Module for color and shapes output
module Output
  def color_squr(number)
    {
      0 => "\e[47m  0  \e[0m",
      1 => "\e[100m  1  \e[0m",
      2 => "\e[101m  2  \e[0m",
      3 => "\e[102m  3  \e[0m",
      4 => "\e[104m  4  \e[0m",
      5 => "\e[105m  5  \e[0m",
      6 => "\e[106m  6  \e[0m",
      7 => "\e[42m  7  \e[0m",
      8 => "\e[45m  8  \e[0m",
      9 => "\e[44m  9  \e[0m"
    }[number]
  end

  def circle(type)
    {
      0 => "\e[37m\u25CF\e[0m", # Full
      1 => "\e[98m\u25CB\e[0m", # empty
      2 => "\e[98m\u25CC\e[0m" # Dotted
    }[type]
  end

  def print_colors(colors)
    colors.each { |color| print "#{color_squr(color)} " }
  end

  def print_clues(clues)
    clues = clues.sort
    print '| Clues: '
    clues.each { |clue| print "#{circle(clue)} " }
  end
end
