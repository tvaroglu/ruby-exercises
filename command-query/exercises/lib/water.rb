class Water
  attr_accessor :temperature, :units

  def initialize()
    @temperature = 295
    @units = 'kelvin'
  end

  def heat()
    self.temperature += 1
  end

  def cool()
    self.temperature -= 1
  end

  def display_current_temp()
    return {
      :temp => self.temperature,
      :units => self.units
    }
  end

  def convert_to(metric='kelvin')
    # convert TO celcius FROM kelvin
    if metric == 'celcius' && self.units == 'kelvin'
      self.temperature = (self.temperature - 273.15).round()
      self.units = 'celcius'
    # convert TO kelvin FROM celcius
    elsif metric == 'kelvin' && self.units == 'celcius'
      self.temperature = (self.temperature + 273.15).round()
      self.units = 'kelvin'
    # convert TO celcius FROM fahrenheit
    elsif metric == 'celcius' && self.units == 'fahrenheit'
      self.temperature = ((self.temperature - 32) * 0.56).round()
      self.units = 'celcius'
    # convert TO fahrenheit FROM celcius
    elsif metric == 'fahrenheit' && self.units == 'celcius'
      self.temperature = 32 + (self.temperature * 1.8).round()
      self.units = 'fahrenheit'
    # convert TO kelvin FROM fahrenheit
    elsif metric == 'kelvin' && self.units == 'fahrenheit'
      self.temperature = (((self.temperature - 32) * 0.56).round() + 273.15).round()
      self.units = 'kelvin'
    # convert TO fahrenheit FROM kelvin
    elsif metric == 'fahrenheit' && self.units == 'kelvin'
      self.temperature = (((self.temperature - 273.15) * 1.8) + 32).round()
      self.units = 'fahrenheit'
    end
  end

end
