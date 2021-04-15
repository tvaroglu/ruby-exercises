class Unicorn
  attr_accessor :name, :color, :energy_level

  def initialize(name='none', color='silver')
    @name = name
    @color = color.downcase
    @energy_level = 100
  end

  def silver?()
    if self.color == 'silver'
      return true
    else
      return false
    end
  end

  def say(something="**;* Hello World! **;*")
    return "**;* #{something} **;*"
  end

  def gallop()
    self.energy_level -= 10
  end

  def sleep()
    self.energy_level += 10
  end

  def change_colors(new_color='silver')
    if new_color.class != String
      self.color = color
    else
      self.color = new_color.downcase
    end
  end

end
