class Dog
  attr_accessor :name, :breed, :greeting

  def initialize(name='Clifford', breed='big red dog')
    @name = name
    @breed = breed
    @greeting = "Woof, I'm #{name} the #{breed}!"
  end

end
