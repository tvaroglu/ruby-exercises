class LeatherChair
  attr_accessor :faded, :expose_to_sunlight

  def initialize()
    @faded = false
  end

  def faded?()
    return self.faded
  end

  def expose_to_sunlight()
    self.faded = true
  end

end
