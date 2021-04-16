class Pirate
  attr_accessor :name, :job, :cursed, :heinous_acts, :booty, :ships_robbed

  def initialize(name='John Smith', job='Scallywag')
    @name = name
    @job = job
    @cursed = false
    @heinous_acts = 0
    @booty = 0
    @ships_robbed = 0
  end

  def commit_heinous_act()
    self.heinous_acts += 1
  end

  def cursed?()
    if self.heinous_acts >= 3
      self.cursed = true
    end
    return self.cursed
  end

  def rob_ship()
    self.booty += 100
    self.ships_robbed += 1
  end

  def dump_booty()
    self.booty = 0
  end

  def change_identity()
    self.name = 'John Smith'
    self.ships_robbed = 0
  end

end
