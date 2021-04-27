class MadLib
  attr_accessor :input_verb, :input_adjective, :input_noun, :input_adverb

  def initialize()
    @input_verb = ''
    @input_adjective = ''
    @input_noun = ''
    @input_adverb = ''
  end

  def verb(word='')
    self.input_verb = word.to_s
  end

  def adjective(word='')
    self.input_adjective = word.to_s
  end

  def noun(word='')
    self.input_noun = word.to_s
  end

  def adverb(word='')
    self.input_adverb = word.to_s
  end

  def result()
    return "Do you #{self.input_verb} your #{self.input_adjective} #{self.input_noun} #{self.input_adverb}? That's hilarious!"
  end

end
