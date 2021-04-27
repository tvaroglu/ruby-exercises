class Light
  attr_accessor :on, :off

  def initialize()
    @on = false
    @off = true
  end

  def on?()
    return self.on
  end

  def off?()
    return self.off
  end

  def turn_on
    self.on = true
    self.off = false
  end

  def turn_off
    self.on = false
    self.off = true
  end

end
