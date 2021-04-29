class Kangaroo
  attr_accessor :name, :children

  def initialize(name='Jack', children=['Joey'])
    @name = name
    if children.class == Array
      if children.length == 1 && children[0].to_s.include?(' ')
        @children = Array.new
        children_split = children[0].to_s.split(' ')
        children_split.each do |child|
          @children << child.strip.capitalize
        end
      else
        @children = children
      end
    else
      @children = Array.new
      if children.to_s.include?(',')
        children_split = children.split(',')
      else
        children_split = children.split(' ')
      end
      children_split.each do |child|
        @children << child.strip.capitalize
      end
    end
  end

end
