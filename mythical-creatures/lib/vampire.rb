class Vampire
  attr_accessor :name, :pet, :pets, :thirsty, :vanquished

  def initialize(name='none', pet='bat')
    @name = name
    @pet = pet
    @thirsty = true
    @vanquished = false
    @pets = Array.new << pet
  end

  def drink()
    self.thirsty = false
  end

  def add_pet(pet)
    self.pets << pet
  end

  def release_pet(pet)
    if self.pets.include? pet
      self.pets.delete(pet)
      if self.pets.length == 1
        self.pet = self.pets[0]
      end
    end
  end

  def expose_to_sunlight(num_minutes)
    if num_minutes.class != Integer || num_minutes <= 0
      return "That won't kill him, try again!"
    elsif num_minutes >= 1 && num_minutes <= 10
      return "That hurt... but it's not enough sunlight to kill #{name}!"
    elsif num_minutes >= 11
      self.vanquished = true
      return "You have vanquished #{name}, good job!"
    end
  end

end
