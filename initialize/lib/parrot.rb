class Parrot
  attr_accessor :sound, :name, :known_words

  def initialize(hash={})
    @sound = 'Squawk!'
    @name = hash[:name]
    if self.name == nil
      self.name = 'Alex'
    end
    @known_words = hash[:known_words]
    if self.known_words == nil
      self.known_words = [self.sound]
    end
  end

end
