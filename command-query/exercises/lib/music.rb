class Music
  attr_accessor :loud

  def initialize()
    @loud = false
  end

  def loud?()
    return self.loud
  end

  def turn_up()
    self.loud = true
  end

  def turn_down()
    self.loud = false
  end

end
