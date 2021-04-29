class Monkey
  attr_reader :attributes

  def initialize(input=[])
    if input.class == Array && input.length == 3
      @attributes = input
    elsif input.class == Array && input.length == 0
      @attributes = ['Curious George', 'Barbary macaque', 'bananas']
    elsif input.class == Array && input.length == 1
      @attributes = input.concat(['Barbary macaque', 'bananas'])
    elsif input.class == Array && input.length == 2
      @attributes = input.concat(['bananas'])
    elsif input.class == Array && input.length > 3
      @attributes = input[0..2]
    elsif input.class == String && input.split(' ').length == 1
      @attributes = Array(input).concat(['Barbary macaque', 'bananas'])
    else
      @attributes = Array.new
    end
  end

  def name()
    return self.attributes[0]
  end

  def type()
    return self.attributes[1]
  end

  def favorite_food()
    return self.attributes[2]
  end

end
