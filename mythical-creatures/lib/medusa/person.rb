require_relative 'medusa'

class Person
  attr_accessor :name, :stoned

  def initialize(name='Perseus')
    @name = name
    @stoned = false
  end

  def stoned?()
    return self.stoned
  end

end


# medusa = Medusa.new
# # p medusa.statues
#
# victim_1 = Person.new
# victim_2 = Person.new('Andromeda')
# victim_3 = Person.new('Aphrodite')
#
# victims = [victim_1, victim_2, victim_3]
# victims.each do |victim|
#   medusa.stare(victim)
# end
#
# p medusa.statues
# # p medusa.display_victims
#
# victim_4 = Person.new('Taylor')
# medusa.stare(victim_4)
#
# p medusa.display_victims
# p victim_1
# p victim_4
