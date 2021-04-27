class Dog
  attr_accessor :hungry

  def initialize()
    @hungry = true
  end

  def hungry?()
    return self.hungry
  end

  def eat()
    self.hungry = false
  end

  def play()
    self.hungry = true
  end

end
