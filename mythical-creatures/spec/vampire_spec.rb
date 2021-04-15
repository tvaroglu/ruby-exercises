require 'rspec'
require_relative '../lib/vampire'

RSpec.describe Vampire do
  it 'has a name' do
    vampire = Vampire.new('Dracula')
    expect(vampire.name).to eq('Dracula')
  end

  it 'it can be named something else' do
    vampire = Vampire.new('Vladimir')
    expect(vampire.name).to eq('Vladimir')
  end

  it 'keeps a pet bat by default' do
    vampire = Vampire.new('Ruthven')
    expect(vampire.pet).to eq('bat')
  end

  it 'can keep other pets' do
    vampire = Vampire.new('Varney', 'fox')
    expect(vampire.pet).to eq('fox')
  end

  it 'is thirsty by default' do
    vampire = Vampire.new('The Count')

    expect(vampire.thirsty).to be true
  end

  it 'is not thirsty after drinking' do
    vampire = Vampire.new('Elizabeth Bathory')

    vampire.drink
    expect(vampire.thirsty).to be false
  end

  it 'can have multiple pets' do
    vampire = Vampire.new('Marlow')
    expect(vampire.pet).to eq('bat')
    expect(vampire.pets).to eq(['bat'])
    expect(vampire.pets.length).to eq(1)

    vampire.add_pet('fox')
    expect(vampire.pets).to eq(['bat', 'fox'])
    expect(vampire.pets.length).to eq(2)
  end

  it 'can release a pet' do
    vampire = Vampire.new('Marlow')
    expect(vampire.pet).to eq('bat')
    expect(vampire.pets).to eq(['bat'])
    expect(vampire.pets.length).to eq(1)

    vampire.add_pet('fox')
    vampire.add_pet('wolf')
    expect(vampire.pets).to eq(['bat', 'fox', 'wolf'])
    expect(vampire.pets.length).to eq(3)

    vampire.release_pet('bat')
    expect(vampire.pets).to eq(['fox', 'wolf'])
    expect(vampire.pet).to eq('fox')
    expect(vampire.pets.length).to eq(2)
  end

  it 'can be exposed to sunlight' do
    vampire = Vampire.new('Marlow')

    expect(vampire.expose_to_sunlight(0)).to eq("That won't kill him, try again!")
    expect(vampire.expose_to_sunlight(1)).to eq("That hurt... but it's not enough sunlight to kill Marlow!")
    expect(vampire.expose_to_sunlight(11)).to eq("You have vanquished Marlow, good job!")
  end

  it 'can be vanquished if exposed to more than 10 minutes of sunlight' do
    vampire = Vampire.new('Marlow')
    expect(vampire.vanquished).to be false

    expect(vampire.expose_to_sunlight(11)).to eq("You have vanquished Marlow, good job!")
    expect(vampire.vanquished).to be true
  end
end
