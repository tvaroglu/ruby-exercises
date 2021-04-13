require_relative 'candy'

class Bag
  attr_accessor :candies

  def initialize()
    @candies = Array.new
  end

  def count()
    return self.candies.count
  end

  def empty?()
    if count() >= 1
      return false
    else
      return true
    end
  end

  def contains?(candy)
    in_bag = false
    candies.each do |candy_type|
      if candy == candy_type.type
        in_bag = true
        break
      end
    end
    return in_bag
  end

end


# test_bag = Bag.new
# p test_bag
# p test_bag.candies
# p test_bag.empty?
# p test_bag.count
#
# test_candy = Candy.new('Sour Patch Kids')
# p test_candy.type
# test_bag.candies << test_candy
#
# p test_bag.candies
# p test_bag.empty?
# p test_bag.count
#
# test_candy_2 = Candy.new('Twix')
# test_bag.candies << test_candy_2
#
# p test_bag.candies
# p test_bag.empty?
# p test_bag.count
