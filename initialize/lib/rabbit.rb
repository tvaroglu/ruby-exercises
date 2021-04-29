class Rabbit
  attr_accessor :num_syllables, :name

  def initialize(hash={})
    @num_syllables = hash[:num_syllables]
    if self.num_syllables == nil
      self.num_syllables = 1
    end

    @name = hash[:name]
    if self.name == nil
      self.name = 'Peter'
      self.num_syllables = 2
    end

    if self.num_syllables == 2
      self.name = "#{self.name} #{Rabbit}"
    elsif self.num_syllables == 3
      self.name = "#{self.name} the #{Rabbit}"
    end

  end

end
