class Clock
  attr_accessor :time

  def initialize()
    @time = 6
  end

  def wait()
    self.time += 1
    if self.time == 12
      self.time = 0
    end
  end

end
