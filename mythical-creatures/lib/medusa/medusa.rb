class Medusa
  attr_accessor :name, :statues, :victim_count, :snakes_in_hair

  def initialize(name='Medusa')
    @name = name
    @statues = Array.new
    @victim_count = 0
    @snakes_in_hair = 3
  end

  def display_victims()
    # puts '['
    # self.statues.each do |statue|
    #   puts "Victim.name = '#{statue.name}'; Victim.stoned? = #{statue.stoned}"
    # end
    # puts ']'
    return self.statues.length
  end

  def stare(victim)
    if victim.class == Person
      victim.is_stoned
      self.statues << victim
      self.victim_count += 1
      if self.victim_count > 0 && self.victim_count % 3 == 0
        self.snakes_in_hair *= 3
      end
      if display_victims() > 3
        unstoned = self.statues.shift
        unstoned.un_stoned
      end
    end
  end

end
