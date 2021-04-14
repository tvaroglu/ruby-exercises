class Candy
  attr_accessor :type

  def initialize(type='none')
    @type = type
  end

  def change_type(new_type)
    self.type = new_type
  end

end


# default_candy = Candy.new
# p default_candy
# p default_candy.type
#
# custom_candy = Candy.new('Skittles')
# p custom_candy
# p custom_candy.type
