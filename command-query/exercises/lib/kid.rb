class Kid
  attr_accessor :grams_of_sugar_eaten, :hyperactive

  def initialize()
    @grams_of_sugar_eaten = 0
    @hyperactive = false
  end

  def hyperactive?()
    return self.hyperactive
  end

  def eat_candy()
    self.grams_of_sugar_eaten += 5
    if self.grams_of_sugar_eaten >= 60
      self.hyperactive = true
    end
  end

  def take_insulin()
    self.grams_of_sugar_eaten = 0
    self.hyperactive = false
  end

end
