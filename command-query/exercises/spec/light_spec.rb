require 'rspec'
require_relative '../lib/light'

RSpec.describe Light do
  it 'is off' do
    light = Light.new

    expect(light.on?).to be false
  end

  it 'can be turned on' do
    light = Light.new

    light.turn_on

    expect(light.on?).to be true
  end

  it 'can be turned off' do
    light = Light.new

    expect(light.on?).to be false
    expect(light.off?).to be true

    light.turn_on

    expect(light.on?).to be true
    expect(light.off?).to be false

    light.turn_off

    expect(light.on?).to be false
    expect(light.off?).to be true
  end
end
