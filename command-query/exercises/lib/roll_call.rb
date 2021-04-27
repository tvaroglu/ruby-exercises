class RollCall
  attr_accessor :names

  def initialize()
    @names = Array.new
  end

  def longest_name()
    return names.max_by do |name|
      name.length
    end
  end

  def <<(name='')
    self.names << name.to_s
  end

  def reset()
    self.names = []
  end

end
