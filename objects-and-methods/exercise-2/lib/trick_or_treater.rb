require_relative 'costume'
require_relative 'bag'

class TrickOrTreater
  attr_accessor :costume, :dressed_up_as, :bag, :candies, :sugar_level

  def initialize(costume='none')
    if costume == 'none'
      @costume = costume
      @dressed_up_as = 'nothing'
    else
      @costume = Costume.new(costume.style.to_s)
      @dressed_up_as = costume.style
    end
    @bag = Bag.new
    @candies = bag.candies
    @sugar_level = 0
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
    candy_eaten = self.candies.shift
    self.sugar_level += candy_eaten.sugar
  end

end


# default_trick_or_treater = TrickOrTreater.new
# # p default_trick_or_treater
# # p default_trick_or_treater.costume
# p default_trick_or_treater.dressed_up_as
# p default_trick_or_treater.bag.empty?
# p default_trick_or_treater.has_candy?
# p default_trick_or_treater.candies
# puts '-' * 10
#
# test_costume = Costume.new('Superman')
# # p test_costume
# p test_costume.style
# puts '-' * 10
#
# custom_trick_or_treater = TrickOrTreater.new(test_costume)
# # p custom_trick_or_treater
# # p custom_trick_or_treater.costume
# p custom_trick_or_treater.dressed_up_as
# p custom_trick_or_treater.bag.empty?
# p custom_trick_or_treater.has_candy?
# p custom_trick_or_treater.candies
# puts '-' * 10
#
# custom_trick_or_treater.bag.candies << Candy.new('Gummy worms', 88)
# custom_trick_or_treater.bag.candies << Candy.new('Liquorice', 83)
# custom_trick_or_treater.bag.candies << Candy.new('Salty Serpents', 71)
# p custom_trick_or_treater.bag.empty?
# p custom_trick_or_treater.has_candy?
# p custom_trick_or_treater.candies
# puts '-' * 10
#
# custom_trick_or_treater.eat
# p custom_trick_or_treater.candies
# p custom_trick_or_treater.sugar_level
# p custom_trick_or_treater.bag.empty?
# p custom_trick_or_treater.has_candy?
# puts '-' * 10
#
# custom_trick_or_treater.eat
# p custom_trick_or_treater.candies
# p custom_trick_or_treater.sugar_level
# p custom_trick_or_treater.bag.empty?
# p custom_trick_or_treater.has_candy?
# puts '-' * 10
#
# custom_trick_or_treater.eat
# p custom_trick_or_treater.candies
# p custom_trick_or_treater.sugar_level
# p custom_trick_or_treater.bag.empty?
# p custom_trick_or_treater.has_candy?
