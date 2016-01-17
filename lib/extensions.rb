class Array
  def all_empty?
    all? { |element| element.to_s.empty? }
  end

  def all_same?
    all? { |element| element == self[0] }
  end

  def any_empty?
    any? { |element| element.to_s.empty? }
  end

  def none_empty?
    !any_empty?
  end
end

class String
  def red
    colorize(:red)
  end

  def yellow
    colorize(:yellow)
  end

  def blue
    colorize(:blue)
  end

  def green
    colorize(:green)
  end

  def light_yellow
    colorize(:light_yellow)
  end

  def back_light_blue
    colorize(background: :light_blue)
  end
end
