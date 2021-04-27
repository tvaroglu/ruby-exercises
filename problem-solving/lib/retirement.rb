class Retirement
  attr_reader :valid_inputs

  def initialize()
    @valid_inputs = [Integer, Float]
  end

  def calculate(current_age=18, retirement_age=65)
    if valid_inputs.index(current_age.class) == nil || valid_inputs.index(retirement_age.class) == nil
      return "Error. Please enter valid numbers to calculate your #{Retirement} age and year."
    elsif current_age < 0
      return 'Error. Age cannot be negative.'
    elsif retirement_age < 0
      return 'Error. Retirement age cannot be negative.'
    elsif current_age.class == Float || retirement_age.class == Float
      return "You have #{(retirement_age - current_age).round(1)} years left until you can retire. It is #{Time.now.year}, so you can retire in #{Time.now.year + (retirement_age - current_age).round()}."
    else
      return "You have #{(retirement_age - current_age).round()} years left until you can retire. It is #{Time.now.year}, so you can retire in #{Time.now.year + (retirement_age - current_age).round()}."
    end
  end

end
