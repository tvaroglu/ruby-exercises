class Werewolf
  attr_accessor :name, :location, :human, :wolf, :hungry, :stomach, :victims_consumed, :status

  def initialize(name='David', location='London')
    @name = name
    @location = location
    @human = true
    @wolf = false
    @hungry = false
    @stomach = Array.new
    @victims_consumed = 0
    @status = 'alive'
  end

  def human?()
    return self.human
  end

  def wolf?()
    return self.wolf
  end

  def hungry?()
    return self.hungry
  end

  def change!()
    if self.human == true
      self.human = false
      self.wolf = true
      self.hungry = true
    elsif self.human == false
      self.human = true
      self.wolf = false
      self.hungry = false
    end
  end

  def consume(victim)
    if self.human != true
      victim.status = :dead
      stomach << victim
      self.victims_consumed += 1
      self.hungry = false
    elsif self.human == true
      self.status = 'dead'
      self.human = false
      self.wolf = false
      self.hungry = false
      self.stomach = []
    end
  end

end
