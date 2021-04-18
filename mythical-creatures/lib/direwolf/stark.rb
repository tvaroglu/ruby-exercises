class Stark
  attr_accessor :name, :location, :safe, :house_words

  def initialize(name='Eddard', location='Winterfell')
    @name = name
    @location = location
    @safe = false
    @house_words = 'Winter is Coming'
  end

  def safe?()
    return self.safe
  end

end
