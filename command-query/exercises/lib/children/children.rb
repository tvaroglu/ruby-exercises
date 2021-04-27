class Children
  attr_accessor :children

  def initialize()
    @children = Array.new
  end

  def <<(child)
    if child.class == Child
      children << {
        :name => child.name,
        :age => child.age
      }
    end
  end

  def eldest()
    return children.max_by do |child|
      child[:age]
    end
  end

end
