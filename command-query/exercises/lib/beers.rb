class Beers
  attr_accessor :inventory

  def initialize()
    @inventory = 99
  end

  def take_one_down_and_pass_it_around()
    self.inventory -= 1
  end

  def restock()
    self.inventory = 99
  end

end
