class Pills
  attr_accessor :count

  def initialize()
    @count = 60
  end

  def pop()
    self.count -= 1
  end

  def refill()
    self.count = 60
  end

end
