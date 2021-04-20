class Hydra
  attr_accessor :name, :heads, :immortal, :stomach

  def initialize(name='Lernaean Hydra', heads=9)
    @name = name
    @heads = heads
    @immortal = true
    @stomach = Array.new
  end

  def consume(person)
    self.stomach << person
    person.status = 'dead'
    self.heads += 1
  end

end
