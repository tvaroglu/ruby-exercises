class Ferret
  attr_accessor :name

  def initialize(name=nil)
    @name = nil
  end

  def give_name(new_name)
    self.name = new_name.to_s
  end

end
