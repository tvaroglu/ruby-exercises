class Wizard
  attr_accessor :name, :bearded, :rested, :spells_cast, :beard_color

  def initialize(name='Merlin', bearded=true)
    @name = name
    @bearded = bearded
    @rested = true
    @spells_cast = 0
    if @bearded == false
      @beard_color = 'none'
    else
      @beard_color = 'grey'
    end
  end

  def bearded?()
    if self.bearded == true
      return true
    else
      return false
    end
  end

  def rested?()
    if self.spells_cast >= 3
      self.rested = false
    end
    return self.rested
  end

  def incantation(string='')
    if string.class != String
      string = string.to_s
    end
    return "sudo #{string}"
  end

  def cast(spell='MAGIC MISSILE!')
    self.spells_cast += 1
    if self.spells_cast >= 3 && self.bearded == true
      self.beard_color = 'white'
    end
    return spell.to_s.upcase
  end

  def sleep()
    self.spells_cast = 0
    self.rested = true
    if self.bearded == true
      self.beard_color = 'grey'
    end
  end

end
