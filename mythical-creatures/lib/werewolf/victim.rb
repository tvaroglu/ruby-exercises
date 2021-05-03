# require_relative 'werewolf'

class Victim
  attr_accessor :status

  def initialize()
    @status = :alive
  end

  def consumed()
    self.status = :dead
  end

end
