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

  def grab(target_candy)
    grabbed = ''
    candies.each do |candy_type|
      if target_candy == candy_type.type
        grabbed = candy_type
        candies.delete_at(candies.index(candy_type))
        break
      end
    end
    return grabbed
  end

  def take(num_candies=1)
    taken = []
    if num_candies.class != Integer || num_candies <= 0
      return taken
    elsif num_candies > 1
      until taken.size == num_candies do
        taken << candies.shift
      end
    elsif num_candies == 1
      taken = candies.shift
    else
      return taken
    end
    return taken
  end

end


# test_bag = Bag.new
# # p test_bag
# # p test_bag.candies
# # p test_bag.empty?
# # p test_bag.count
# # puts '-' * 10
# #
# test_candy = Candy.new('Sour Patch Kids')
# # p test_candy.type
# test_bag.candies << test_candy
# # p test_bag.candies
# # p test_bag.empty?
# # p test_bag.count
# # puts '-' * 10
# #
# test_candy_2 = Candy.new('Reeses', 100)
# test_candy_3 = Candy.new('Twix', 75)
# test_bag.candies << test_candy_2
# test_bag.candies << test_candy_3
# # p test_bag.candies
# # p test_bag.empty?
# # p test_bag.count
# # puts '-' * 10
# #
# # test_bag.grab('Twix')
# # p test_bag.candies
# # p test_bag.empty?
# # p test_bag.count
# # puts '-' * 10
# #
# # test_bag.candies << test_candy_2
# # p test_bag.candies
# # p test_bag.empty?
# # p test_bag.count
# test_candy_4 = Candy.new('Twix', 200)
# test_bag.candies << test_candy_4
# p test_bag.candies
# p test_bag.empty?
# p test_bag.count
# puts '-' * 10
#
# test_bag.take(2)
# p test_bag.candies
# p test_bag.empty?
# p test_bag.count
