class Adult
  attr_accessor :sober, :beverages_consumed

  def initialize()
    @sober = true
    @beverages_consumed = 0
  end

  def sober?()
    return self.sober
  end

  def consume_an_alcoholic_beverage()
    self.beverages_consumed += 1
    if self.beverages_consumed >= 3
      self.sober = false
    end
  end

  def consume_a_greasy_meal()
    self.beverages_consumed = 0
    self.sober = true
  end

end
