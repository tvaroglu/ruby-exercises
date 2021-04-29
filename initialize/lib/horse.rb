class Horse
  attr_accessor :name, :diet

  def initialize(name='Seabiscuit')
    @name = name
    @diet = Array.new
  end

  def add_to_diet(food)
    self.diet << food.to_s
  end

  def digest()
    self.diet = []
  end

end
