class Costume
  attr_accessor :style

  def initialize(style='none')
    @style = style
  end

end


# default_costume = Costume.new
# p default_costume
# p default_costume.style
#
# custom_costume = Costume.new('Batman')
# p custom_costume
# p custom_costume.style
