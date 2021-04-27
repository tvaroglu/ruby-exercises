require 'rspec'
require_relative '../lib/water'

RSpec.describe Water do
  it 'is at room temperature' do
    water = Water.new

    expect(water.temperature).to eq(295) # Measured in Kelvin
  end

  it 'can be heated' do
    water = Water.new

    water.heat
    expect(water.temperature).to eq(296)

    20.times { water.heat }
    expect(water.temperature).to eq(316)
  end

  it 'can be cooled' do
    water = Water.new

    expect(water.temperature).to eq(295)

    25.times { water.heat }

    expect(water.temperature).to eq(320)

    30.times { water.cool }

    expect(water.temperature).to eq(290)
  end

  it 'can display current temperature and units' do
    water = Water.new

    expect(water.display_current_temp).to eq({:temp=>295,:units=>'kelvin'})
  end

  it 'can convert temperatures' do
    water = Water.new

    expect(water.display_current_temp).to eq({:temp=>295,:units=>'kelvin'})

    5.times { water.heat }

    expect(water.display_current_temp).to eq({:temp=>300,:units=>'kelvin'})

    water.convert_to('celcius')

    expect(water.display_current_temp).to eq({:temp=>27,:units=>'celcius'})

    water.convert_to('kelvin')

    expect(water.display_current_temp).to eq({:temp=>300,:units=>'kelvin'})

    water.convert_to('celcius')
    water.convert_to('fahrenheit')

    expect(water.display_current_temp).to eq({:temp=>81,:units=>'fahrenheit'})

    water.convert_to('celcius')

    expect(water.display_current_temp).to eq({:temp=>27,:units=>'celcius'})

    water.convert_to('fahrenheit')
    water.convert_to('kelvin')

    expect(water.display_current_temp).to eq({:temp=>300,:units=>'kelvin'})

    water.convert_to('fahrenheit')
    expect(water.display_current_temp).to eq({:temp=>80,:units=>'fahrenheit'})
  end

  it 'can only be converted to valid temperature units' do
    water = Water.new
    expect(water.display_current_temp).to eq({:temp=>295,:units=>'kelvin'})

    water.convert_to('fahrenheit')
    expect(water.display_current_temp).to eq({:temp=>71,:units=>'fahrenheit'})

    water.convert_to(123)
    expect(water.display_current_temp).to eq({:temp=>71,:units=>'fahrenheit'})

    water.convert_to('fahrenheit')
    expect(water.display_current_temp).to eq({:temp=>71,:units=>'fahrenheit'})
  end
end
