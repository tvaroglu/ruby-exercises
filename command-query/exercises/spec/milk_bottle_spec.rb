require 'rspec'
require_relative '../lib/milk_bottle'

RSpec.describe MilkBottle do
  it 'starts off as full' do
    bottle = MilkBottle.new
    expect(bottle.full?).to be true
  end

  it 'spills milk' do
    bottle = MilkBottle.new

    bottle.spill

    expect(bottle.full?).to be false
  end

  it 'can be refilled' do
    bottle = MilkBottle.new

    expect(bottle.full?).to be true

    bottle.spill

    expect(bottle.full?).to be false

    bottle.refill

    expect(bottle.full?).to be true
  end
end
