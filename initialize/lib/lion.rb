class Lion
  attr_accessor :name, :sound

  def initialize(hash={})
    @name = hash[:name]
    if self.name == nil
      self.name = 'Azlan'
    end
    @sound = hash[:sound]
    if self.sound == nil
      self.sound = 'RAWR!!!'
    end
  end

end
