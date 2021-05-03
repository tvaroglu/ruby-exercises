class Human
  attr_accessor :name, :status, :zombies_killed

  def initialize(name='Shaun')
    @name = name
    @status = 'alive'
    @zombies_killed = 0
  end

  def is_undead()
    self.status = 'undead'
  end

  def is_consumed()
    self.status = 'consumed'
  end

  def kill(zombie)
    if zombie.class == Zombie
      if self.status != 'consumed' && self.status != 'undead'
        if zombie.status == 'undead'
          zombie.is_double_tapped
          self.zombies_killed += 1
        end
      end
    end
  end

end
