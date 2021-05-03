class Stark
  attr_accessor :name, :location, :safe, :house_words

  def initialize(name='Eddard', location='Winterfell')
    @name = name
    @location = location
    @safe = false
    @house_words = 'Winter is Coming'
  end

  def is_safe()
    self.safe = true
  end

  def un_safe()
    self.safe = false
  end

  def safe?()
    return self.safe
  end

end
