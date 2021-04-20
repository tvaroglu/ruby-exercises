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
    if human.status != 'undead' && self.status != 'double-tapped'
      human.status = 'undead'
      self.people_turned += 1
    end
  end

  def consume(human)
    if self.status != 'double-tapped'
      self.stomach << human
      human.status = 'consumed'
      self.people_consumed += 1
    end
  end

end
