class Kous
  attr_accessor :full_name, :is_furry, :is_stressed, :treats

  def initialize()
    @full_name = 'Cinder'
    @is_furry = true
    @is_stressed = false
    @treats = Array.new
  end

  def furry?()
    return self.is_furry
  end

  def stressed?()
    return self.is_stressed
  end

  def be_stressed()
    self.is_stressed = true
  end

  def de_stress()
    self.is_stressed = false
  end

  def eat(treat)
    if self.stomach.include?(treat) == true
      self.stomach.delete(treat)
      self.is_stressed = false
    end
  end

  def accept(treat)
    if treat.class == String && self.treats.include?(treat.to_s) == false
      self.treats << treat
      self.de_stress
    end
  end

  def remove(treat)
    if self.treats.include?(treat.to_s) == true
      self.treats.delete(treat)
      self.be_stressed
    end
  end

  def play_with(person)
    if person.name == 'Talia'
      return 'nesting!'
    elsif person.name == 'Cody' && stressed?() != true
      return 'nesting!'
    elsif person.name == 'Cody' && stressed?() == true
      return 'peeing on the bed now!'
    elsif person.name == 'Taylor'
      return "crab-monkey'ing!"
    else
      return 'CVB infection!'
    end
  end

  def take_bath()
    self.is_stressed = true
  end

  def sleep()
    self.is_stressed = false
    self.treats = []
  end

end
