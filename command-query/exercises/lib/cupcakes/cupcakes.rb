class Cupcakes
  attr_accessor :cupcakes

  def initialize()
    @cupcakes = Array.new
  end

  def <<(cupcake)
    if cupcake.class == Cupcake
      self.cupcakes << cupcake
    end
  end

  def sweetest()
    return self.cupcakes.max_by do |cupcake|
      cupcake.sugar
      # cupcake[:sugar]
    end
  end

  def clean_plate()
    self.cupcakes = []
  end

end
