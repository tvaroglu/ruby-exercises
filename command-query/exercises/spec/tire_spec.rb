require 'rspec'
require_relative '../lib/tire'

RSpec.describe Tire do
  it 'does not start out flat' do
    tire = Tire.new

    expect(tire.flat?).to be false
  end

  it 'can have a blowout' do
    tire = Tire.new

    tire.blow_out
    expect(tire.flat?).to be true
  end

  it 'can be reinflated' do
    tire = Tire.new

    expect(tire.flat?).to be false

    tire.blow_out

    expect(tire.flat?).to be true

    tire.inflate

    expect(tire.flat?).to be false
  end
end
