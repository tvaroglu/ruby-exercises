class Centaur
  attr_accessor :name, :breed, :cranky, :standing, :laying, :energy_level, :color

  def initialize(name='Chiron', breed='Thoroughbred', color='white')
    @name = name
    @breed = breed
    @color = color
    @cranky = false
    @standing = true
    @laying = false
    @energy_level = 3
  end

  def cranky?()
    return self.cranky
  end

  def standing?()
    return self.standing
  end

  def laying?()
    return self.laying
  end

  def shoot()
    self.energy_level -= 1
    if self.energy_level < 1
      self.cranky = true
      self.energy_level = 0
      if cranky?() == true
        return 'NO!'
      end
    elsif laying?() == true
      return 'NO!'
    else
      return 'Twang!!!'
    end
  end

  def run()
    self.energy_level -= 1
    if self.energy_level < 1
      self.cranky = true
      self.energy_level = 0
      if cranky?() == true
        return 'NO!'
      end
    elsif laying?() == true
      return 'NO!'
    else
      return 'Clop clop clop clop!'
    end
  end

  def sleep()
    if standing?() == true
      return 'NO!'
    else
      self.energy_level = 3
      self.cranky = false
    end
  end

  def lay_down()
    self.standing = false
    self.laying = true
  end

  def stand_up()
    self.standing = true
    self.laying = false
  end

  def drink_potion()
    if standing?() == false
      return 'NO!'
    elsif cranky?() == false
      return 'YUCK!'
    else
      self.energy_level = 3
      self.cranky = false
    end
  end

  def change_colors(new_color)
    if new_color.class == String
      self.color = new_color
    end
  end

end
