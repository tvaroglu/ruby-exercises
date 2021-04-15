class Dragon
  attr_accessor :name, :color, :rider, :hungry, :times_eaten, :treasures

  def initialize(name='Smaug', color=:gold, rider='none')
    @name = name
    @color = color
    @rider = rider
    @hungry = true
    @times_eaten = 0
    @treasures = Array.new
  end

  def hungry?()
    if self.times_eaten >= 3
      return false
    elsif self.hungry == true
      return true
    else
      return false
    end
  end

  def eat()
    self.times_eaten += 1
  end

  def digest()
    self.times_eaten = 0
  end

  def collect(treasure)
    self.treasures << treasure.to_s
  end

  def display_treasures()
    return self.treasures
  end

  def devour_treasures()
    self.treasures = []
  end

end
