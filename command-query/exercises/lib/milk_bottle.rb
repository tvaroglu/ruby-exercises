class MilkBottle
  attr_accessor :full

  def initialize()
    @full = true
  end

  def full?()
    return self.full
  end

  def spill()
    self.full = false
  end

  def refill()
    self.full = true
  end

end
