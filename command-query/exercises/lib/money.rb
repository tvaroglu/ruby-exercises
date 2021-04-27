class Money
  attr_accessor :amount

  def initialize()
    @amount = 0
  end

  def earn(amount=0)
    self.amount += amount
  end

  def spend(amount=0)
    self.amount -= amount
  end

end
