require 'rspec'
require_relative '../lib/door'

RSpec.describe Door do
  it 'is locked' do
    door = Door.new

    expect(door.locked?).to be true
  end

  it 'unlocks the door' do
    door = Door.new

    door.unlock

    expect(door.locked?).to be false
  end

  it 'locks the door' do
    door = Door.new

    expect(door.locked?).to be true

    door.unlock

    expect(door.locked?).to be false

    door.lock

    expect(door.locked?).to be true
  end
end
