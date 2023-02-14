# frozen_string_literal: false

# Add styles to strings
class String
  def bold
    "\e[1m#{self}\e[22m"
  end

  def underline
    "\e[4m#{self}\e[24m"
  end
end
