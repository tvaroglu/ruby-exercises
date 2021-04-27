class Baby
  attr_accessor :tired

  def initialize()
    @tired = true
  end

  def tired?()
    return self.tired
  end

  def nap()
    self.tired = false
  end

  def play()
    self.tired = true
  end

end
