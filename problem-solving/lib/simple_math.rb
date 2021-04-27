class SimpleMath
  attr_reader :valid_inputs

  def initialize()
    @valid_inputs = [Integer, Float]
  end

  def add(num1, num2)
    inputs_are_valid = true
    if valid_inputs.index(num1.class) == nil || valid_inputs.index(num2.class) == nil
      inputs_are_valid = false
    end
    if inputs_are_valid == true
      return (num1 + num2).round()
    else
      return nil
    end
  end

  def subtract(num1, num2)
    inputs_are_valid = true
    if valid_inputs.index(num1.class) == nil || valid_inputs.index(num2.class) == nil
      inputs_are_valid = false
    end
    if inputs_are_valid == true
      return (num1 - num2).round()
    else
      return nil
    end
  end

  def multiply(num1, num2)
    inputs_are_valid = true
    if valid_inputs.index(num1.class) == nil || valid_inputs.index(num2.class) == nil
      inputs_are_valid = false
    end
    if inputs_are_valid == true
      return (num1 * num2).round()
    else
      return nil
    end
  end

  def divide(num1, num2)
    inputs_are_valid = true
    if valid_inputs.index(num1.class) == nil || valid_inputs.index(num2.class) == nil || num2 == 0
      inputs_are_valid = false
    end
    if inputs_are_valid == true
      return (num1 / num2).round()
    else
      return nil
    end
  end

end
