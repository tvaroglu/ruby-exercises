class Person
  attr_accessor :name

  def initialize(name='John')
    @name = name
  end

  def give_treat(kous, treat)
    if treat.class == String && kous.treats.include?(treat.to_s) == false
      kous.treats << treat
      kous.is_stressed = false
    end
  end

  def take_treat(kous, treat=nil)
    if kous.treats.include?(treat.to_s) == true
      kous.treats.delete(treat)
      kous.is_stressed = true
    end
  end

end
