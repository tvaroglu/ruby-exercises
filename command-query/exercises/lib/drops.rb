class Drops
  attr_accessor :count

  def initialize()
    @count = 0
  end

  def drip()
    self.count += 1
  end

end
