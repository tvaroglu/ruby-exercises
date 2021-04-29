require_relative 'narwhal'

class Octopus
  attr_accessor :name, :friend, :friends

  def initialize(name='Paul', friend=Narwhal.new)
    @name = name
    @friend = friend
    @friends = Array.new << self.friend
  end


  def add_friend(new_friend)
    self.friends << new_friend
  end


  def unfriend(enemy)
    begin
      query = self.friends.find do |friend|
        enemy.to_s == friend.name
      end

    rescue NoMethodError
      query = self.friends.find do |friend|
        enemy.to_s == friend
      end

    ensure
      if query != nil
        self.friends.delete(query)
      end

    end
  end


  def friends?()
    return self.friends
  end

end
