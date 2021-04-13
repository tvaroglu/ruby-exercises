class Candy
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def change_type(new_type)
    self.type = new_type
  end

end
