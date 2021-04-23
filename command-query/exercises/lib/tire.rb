class Tire
  attr_accessor :flat, :blow_out

  def initialize()
    @flat = false
  end

  def flat?()
    return self.flat
  end

  def blow_out
    self.flat = true
  end

end
