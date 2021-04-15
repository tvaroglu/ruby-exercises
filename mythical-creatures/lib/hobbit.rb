class Hobbit
  attr_accessor :name, :disposition, :weapon, :age, :is_short, :has_ring

  def initialize(name='Bilbo Baggins', disposition='homebody', weapon='dagger')
    @name = name
    @disposition = disposition
    @weapon = weapon
    @age = 0
    @is_short = true
    if @name == 'Frodo'
      @has_ring = true
    else
      @has_ring = false
    end
  end

  def adult?()
    if self.age >= 33
      return true
    else
      return false
    end
  end

  def old?()
    if self.age >= 101
      return true
    else
      return false
    end
  end

  def celebrate_birthday()
    self.age += 1
  end

  def has_ring?()
    if self.has_ring == true
      return true
    else
      return false
    end
  end

  def is_short?()
    if self.is_short == true
      return true
    else
      return false
    end
  end

  def grow()
    self.is_short = false
  end

  def change_weapon(new_weapon='none')
    if new_weapon.class == String
      self.weapon = new_weapon
    end
  end

end
