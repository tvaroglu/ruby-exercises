require 'rspec'
require_relative '../lib/baby'

RSpec.describe Baby do
  it 'is tired' do
    baby = Baby.new

    expect(baby.tired?).to be true
  end

  it 'is not tired after a nap' do
    baby = Baby.new

    baby.nap
    expect(baby.tired?).to be false
  end

  it 'is tired after playing' do
    baby = Baby.new

    expect(baby.tired?).to be true

    baby.nap

    expect(baby.tired?).to be false

    baby.play

    expect(baby.tired?).to be true
  end
end
