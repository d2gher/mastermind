# frozen_string_literal: false

# Module for color and shapes output
module Output
  def color_squr(number)
    {
      1 => "\e[100m  1  \e[0m",
      2 => "\e[101m  2  \e[0m",
      3 => "\e[102m  3  \e[0m",
      4 => "\e[104m  4  \e[0m",
      5 => "\e[105m  5  \e[0m",
      6 => "\e[106m  6  \e[0m"
    }[number]
  end

  def circle(type)
    {
      full => "\e[37m\u25CF\e[0m",
      empty => "\e[98m\u25CB\e[0m",
      dotted => "\e[98m\u25CC\e[0m"
    }[type]
  end
end
