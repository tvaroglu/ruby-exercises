class Yak
  attr_accessor :hairy

  def initialize()
    @hairy = true
  end

  def hairy?()
    return self.hairy
  end

  def shave()
    self.hairy = false
  end

end
