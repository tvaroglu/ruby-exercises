class Apple
  attr_accessor :ripe, :rotten, :weeks_old

  def initialize()
    @ripe = false
    @rotten = false
    @weeks_old = 0
  end

  def ripe?()
    return self.ripe
  end

  def rotten?()
    return self.rotten
  end

  def wait_a_week()
    self.weeks_old += 1
    if self.weeks_old >= 3 && self.weeks_old <= 5
      self.ripe = true
    elsif self.weeks_old > 5
      self.ripe = false
      self.rotten = true
    end
  end

end
