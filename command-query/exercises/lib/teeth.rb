class Teeth
  attr_accessor :clean

  def initialize()
    @clean = false
  end

  def clean?()
    return self.clean
  end

  def brush()
    self.clean = true
  end

  def eat()
    self.clean = false
  end

end
