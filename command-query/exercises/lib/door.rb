class Door
  attr_accessor :locked

  def initialize()
    @locked = true
  end

  def locked?()
    return self.locked
  end

  def unlock()
    self.locked = false
  end

  def lock()
    self.locked = true
  end

end
