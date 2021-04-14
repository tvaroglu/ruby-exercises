class Candy
  attr_accessor :type, :sugar

  def initialize(type='none', sugar=100)
    @type = type
    @sugar = sugar
  end

  def change_type(new_type)
    self.type = new_type
  end

end


# default_candy = Candy.new
# p default_candy
# p default_candy.type
# p default_candy.sugar
#
# custom_candy = Candy.new('Skittles', 80)
# p custom_candy
# p custom_candy.type
# p custom_candy.sugar
