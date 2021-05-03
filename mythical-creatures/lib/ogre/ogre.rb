class Ogre
  attr_accessor :name, :home, :swings, :encounter_counter

  def initialize(name='Shrek', home='Swamp')
    @name = name
    @home = home
    @encounter_counter = 0
    @swings = 0
  end

  def encounter(human)
    if human.class == Human
      human.increment_encounters
    end
    self.encounter_counter += 1
    if human.notices_ogre?() == true
      human.increment_swings
      self.swings += 1
    end
  end

  def swing_at(human)
    if human.class == Human
      human.increment_swings
    end
    self.swings += 1
  end

  def apologize(human)
    if human.class == Human
      if human.dead != true
        human.apologized_to = true
      else
        return "whoops... that might've been a bit much..."
      end
    end
  end

end
