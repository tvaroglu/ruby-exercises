class Human
  attr_accessor :name, :status, :zombies_killed

  def initialize(name='Shaun')
    @name = name
    @status = 'alive'
    @zombies_killed = 0
  end

  def kill(zombie)
    if self.status != 'consumed' && self.status != 'undead'
      if zombie.status == 'undead'
        zombie.status = 'double-tapped'
        self.zombies_killed += 1
      end
    end
  end

end
