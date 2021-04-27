require_relative "../lib/retirement"

RSpec.describe Retirement do

  it 'can tell me when I should retire' do
    retire = Retirement.new

    result = retire.calculate(25, 65)
    expected = "You have 40 years left until you can retire. It is 2021, so you can retire in 2061."

    expect(result).to eq(expected)
  end

  it 'tells me when to retire with different ages' do
    retire = Retirement.new

    result = retire.calculate(39, 70)
    expected = "You have 31 years left until you can retire. It is 2021, so you can retire in 2052."

    expect(result).to eq(expected)
  end

  it 'errors with a negative age' do
    retire = Retirement.new

    result = retire.calculate(-25, 65)
    expected = "Error. Age cannot be negative."

    expect(result).to eq(expected)
  end

  it 'errors with a negative retirement age' do
    retire = Retirement.new

    result = retire.calculate(25, -65)
    expected = "Error. Retirement age cannot be negative."

    expect(result).to eq(expected)
  end

  it 'errors if both arguments are neither floats nor integers' do
    retire = Retirement.new

    expect(retire.calculate('today', 65)).to eq('Error. Please enter valid numbers to calculate your Retirement age and year.')
    expect(retire.calculate(25.5, 'someday')).to eq('Error. Please enter valid numbers to calculate your Retirement age and year.')
    expect(retire.calculate('today', 'someday')).to eq('Error. Please enter valid numbers to calculate your Retirement age and year.')
  end
  
  it 'calculates a default retirement age if no arguments are supplied' do
    retire = Retirement.new

    result = retire.calculate
    expected = "You have 47 years left until you can retire. It is 2021, so you can retire in 2068."

    expect(result).to eq(expected)
  end

  it 'calculates partial years if float arguments are supplied' do
    retire = Retirement.new

    result = retire.calculate(25.5, 65)
    expected = "You have 39.5 years left until you can retire. It is 2021, so you can retire in 2061."

    expect(result).to eq(expected)
  end
end
