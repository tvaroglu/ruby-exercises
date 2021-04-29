class Iguana
  attr_accessor :colors

  def initialize()
    @colors = Array.new
  end

  def current_color?()
    if self.colors.length == 0
      self.colors << 'Green'
    end
    return self.colors[0]
  end

  def change_colors(new_color)
    if new_color.class != String
      return current_color?()
    else
      if self.colors.index(new_color.capitalize) == nil
        self.colors.unshift(new_color.capitalize)
      end
      return current_color?()
    end
  end

end
