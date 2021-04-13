require_relative 'costume'
require_relative 'bag'

class TrickOrTreater
  attr_accessor :dressed_up_as, :costume, :bag, :candies

  def initialize(costume)
    @costume = Costume.new(costume.style.to_s)
    @dressed_up_as = costume.style
    @bag = Bag.new
    @candies = bag.candies
  end

  def has_candy?()
    if self.bag.empty? == true
      return false
    else
      return true
    end
  end

  def candy_count()
    return self.candies.count
  end

  def eat()
    self.candies = candies.drop(1)
  end

end


# test_costume = Costume.new('Superman')
# # p test_costume
# p test_costume.style
# puts '-' * 10
#
# test_trick_or_treater = TrickOrTreater.new(test_costume)
# # p test_trick_or_treater
# # p test_trick_or_treater.costume
# p test_trick_or_treater.dressed_up_as
# p test_trick_or_treater.bag.empty?
# p test_trick_or_treater.candies
# p test_trick_or_treater.has_candy?
