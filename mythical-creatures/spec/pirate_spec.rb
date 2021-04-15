require 'rspec'
require_relative '../lib/pirate'

RSpec.describe Pirate do
  it 'has a name' do
    pirate = Pirate.new('Jane')
    expect(pirate.name).to eq('Jane')
  end

  it 'can have a different name' do
    pirate = Pirate.new('Blackbeard')
    expect(pirate.name).to eq('Blackbeard')
  end

  it 'is a scallywag by default' do
    pirate = Pirate.new('Jane')
    expect(pirate.job).to eq('Scallywag')
  end

  it 'is not always a scallywag' do
    pirate = Pirate.new('Jack', 'cook')
    expect(pirate.job).to eq('cook')
  end

  it 'is not cursed by default' do
    pirate = Pirate.new('Jack')

    expect(pirate.cursed?).to be false

    pirate.commit_heinous_act
    expect(pirate.cursed?).to be false

    pirate.commit_heinous_act
    expect(pirate.cursed?).to be false

    pirate.commit_heinous_act
    expect(pirate.cursed?).to be true
  end

  it 'has a booty' do
    pirate = Pirate.new
    expect(pirate.name).to eq('John Smith')

    expect(pirate.booty).to eq(0)
  end

  it 'gets 100 booty for robbing a ship' do
    pirate = Pirate.new

    pirate.rob_ship
    expect(pirate.booty).to eq(100)

    pirate.rob_ship
    expect(pirate.booty).to eq(200)

    pirate.rob_ship
    expect(pirate.booty).to eq(300)
  end

  it 'can dump the booty in the ocean' do
    pirate = Pirate.new

    5.times do
      pirate.rob_ship
    end
    expect(pirate.booty).to eq(500)

    pirate.dump_booty
    expect(pirate.booty).to eq(0)
  end

  it 'can track the number of ships robbed' do
    pirate = Pirate.new

    10.times do
      pirate.rob_ship
    end
    expect(pirate.ships_robbed).to eq(10)
  end

  it 'can change identities to conceal the number of ships robbed' do
    pirate = Pirate.new('Jack Sparrow')

    3.times do
      pirate.rob_ship
    end
    expect(pirate.name).to eq('Jack Sparrow')
    expect(pirate.ships_robbed).to eq(3)

    pirate.change_identity
    expect(pirate.name).to eq('John Smith')
    expect(pirate.ships_robbed).to eq(0)
  end
end
