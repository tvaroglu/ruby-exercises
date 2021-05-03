class Person
  attr_accessor :name

  def initialize(name='John')
    @name = name
  end

  def give_treat(kous, treat)
    if kous.class == Kous
      kous.accept(treat)
    end
  end

  def take_treat(kous, treat=nil)
    if kous.class == Kous
      kous.remove(treat)
    end
  end

end
