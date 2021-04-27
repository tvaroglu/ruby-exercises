require 'rspec'
require_relative '../lib/adult'

RSpec.describe Adult do
  it 'does not get drunk too easily' do
    adult = Adult.new

    adult.consume_an_alcoholic_beverage
    expect(adult.sober?).to be true

    adult.consume_an_alcoholic_beverage
    expect(adult.sober?).to be true

    adult.consume_an_alcoholic_beverage
    expect(adult.sober?).to be false

    adult.consume_an_alcoholic_beverage
    expect(adult.sober?).to be false
  end

  it 'can sober up by eating a greasy meal' do
    adult = Adult.new

    expect(adult.beverages_consumed).to eq(0)
    expect(adult.sober?).to be true

    3.times { adult.consume_an_alcoholic_beverage }

    expect(adult.beverages_consumed).to eq(3)
    expect(adult.sober?).to be false

    adult.consume_a_greasy_meal

    expect(adult.beverages_consumed).to eq(0)
    expect(adult.sober?).to be true
  end
end
