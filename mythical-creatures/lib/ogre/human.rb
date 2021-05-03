class Human
  attr_accessor :name, :encounter_counter, :swung_at, :notices_ogre, :knocked_out, :apologized_to, :dead

  def initialize(name='Jane')
    @name = name
    @encounter_counter = 0
    @swung_at = 0
    @notices_ogre = false
    @knocked_out = false
    @apologized_to = false
    @dead = false
  end

  def increment_encounters()
    self.encounter_counter += 1
  end

  def increment_swings()
    self.swung_at += 1
  end

  def notices_ogre?()
    if dead?() == true
      self.notices_ogre = false
    elsif self.encounter_counter >= 3 && self.encounter_counter % 3 == 0
      self.notices_ogre = true
    else
      self.notices_ogre = false
    end
    return self.notices_ogre
  end

  def knocked_out?()
    if self.apologized_to == true && self.dead != true
      self.knocked_out = false
    elsif self.swung_at >= 2 && self.swung_at % 2 == 0
      self.knocked_out = true
    end
    return self.knocked_out
  end

  def dead?()
    if knocked_out?() == true && self.swung_at >= 3
      self.dead = true
    end
    return self.dead
  end

end
