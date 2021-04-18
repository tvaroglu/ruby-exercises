class Direwolf
  attr_accessor :name, :home, :size, :color, :starks_to_protect, :hunts_white_walkers

  def initialize(name='Aenocyon Dirus', home='Beyond the Wall', size='Massive', color='White')
    @name = name
    @home = home
    @size = size
    @color = color
    @starks_to_protect = Array.new
    @hunts_white_walkers = true
  end

  def protects(stark)
    if self.home == stark.location && self.starks_to_protect.length < 2
      self.starks_to_protect << stark
      stark.safe = true
    end
  end

  def hunts_white_walkers?()
    if starks_to_protect.length > 0
      self.hunts_white_walkers = false
    end
    return self.hunts_white_walkers
  end

  def leaves(stark)
    stark.safe = false
    self.starks_to_protect.delete(stark)
    return stark
  end

  def release_starks()
    self.starks_to_protect.each do |stark|
      stark.safe = false
    end
    self.starks_to_protect = []
    self.hunts_white_walkers = true
  end

  def change_color(new_color)
    if new_color.class == String
      self.color = new_color.capitalize
    end
  end

end
