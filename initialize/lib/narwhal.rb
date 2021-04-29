class Narwhal
  attr_accessor :cute, :weight, :name

  def initialize(hash={})
    @cute = hash[:cute]
    if self.cute == nil
      self.cute = true
    end
    @weight = hash[:weight]
    if self.weight == nil
      self.weight = 1000
    end
    @name = hash[:name]
    if self.name == nil
      self.name = 'Gnarwall'
    end
  end

  def cute?()
    return self.cute
  end

end
