class Zombie
  attr_accessor :name, :virus, :status, :people_turned, :people_consumed, :stomach

  def initialize(name='Pete', virus='RAGE')
    @name = name
    @virus = virus
    @status = 'undead'
    @people_turned = 0
    @people_consumed = 0
    @stomach = Array.new
  end

  def bite(human)
    if human.class == Human
      if human.status != 'undead' && self.status != 'double-tapped'
        human.is_undead
        self.people_turned += 1
      end
    end
  end

  def consume(human)
    if human.class == Human
      if self.status != 'double-tapped'
        self.stomach << human
        human.is_consumed
        self.people_consumed += 1
      end
    end
  end

  def is_double_tapped()
    self.status = 'double-tapped'
  end

end
