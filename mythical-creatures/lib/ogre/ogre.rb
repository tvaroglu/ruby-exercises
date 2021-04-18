class Ogre
  attr_accessor :name, :home, :swings, :encounter_counter

  def initialize(name='Shrek', home='Swamp')
    @name = name
    @home = home
    @encounter_counter = 0
    @swings = 0
  end

  def encounter(human)
    human.encounter_counter += 1
    self.encounter_counter += 1
    if human.notices_ogre?() == true
      self.swings += 1
      human.swung_at += 1
    end
  end

  def swing_at(human)
    self.swings += 1
    human.swung_at += 1
  end

  def apologize(human)
    if human.dead != true
      human.apologized_to = true
    else
      return "whoops... that might've been a bit much..."
    end
  end

end
