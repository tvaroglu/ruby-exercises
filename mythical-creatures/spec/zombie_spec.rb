require 'rspec'
require_relative '../lib/zombie/zombie'
require_relative '../lib/zombie/human'

RSpec.describe Zombie do
  it 'has a name' do
    zombie = Zombie.new
    expect(zombie.name).to eq('Pete')
  end

  it 'can have a different name' do
    zombie = Zombie.new('Andrea')
    expect(zombie.name).to eq('Andrea')
  end

  it 'is infected with the RAGE virus by default' do
    zombie = Zombie.new
    expect(zombie.virus).to eq('RAGE')
  end

  it 'can be infected by a different virus' do
    zombie = Zombie.new('Sergio', 'Pithovirus')
    expect(zombie.virus).to eq('Pithovirus')
  end

  it 'can turn a human into a zombie' do
    zombie = Zombie.new
    human = Human.new

    expect(human.name).to eq('Shaun')
    expect(human.zombies_killed).to eq(0)

    expect(zombie.people_turned).to eq(0)
    expect(zombie.stomach).to eq([])

    zombie.bite(human)

    expect(human.status).to eq('undead')
    expect(zombie.people_turned).to eq(1)
    expect(zombie.stomach).to eq([])
  end

  it 'can consume a human entirely' do
    zombie = Zombie.new
    human = Human.new

    expect(zombie.people_turned).to eq(0)
    expect(zombie.people_consumed).to eq(0)
    expect(zombie.stomach).to eq([])

    zombie.consume(human)

    expect(human.status).to eq('consumed')
    expect(zombie.people_turned).to eq(0)
    expect(zombie.people_consumed).to eq(1)
    expect(zombie.stomach.length).to eq(1)
  end

  it 'can consume multiple people' do
    zombie = Zombie.new
    people = []

    3.times { people << person = Human.new }
    expect(people.length).to eq(3)

    people.each do |person|
      zombie.consume(person)
    end

    expect(zombie.stomach.length).to eq(3)
    expect(zombie.people_consumed).to eq(3)

    people.each do |corpse|
      expect(corpse.status).to eq('consumed')
    end
  end

  it 'can be killed by a human' do
    zombie = Zombie.new
    human = Human.new

    expect(zombie.status).to eq('undead')
    expect(human.status).to eq('alive')
    expect(human.zombies_killed).to eq(0)

    human.kill(zombie)

    expect(zombie.status).to eq('double-tapped')
    expect(human.zombies_killed).to eq(1)
  end

  it 'cannot be killed by another zombie' do
    zombie = Zombie.new
    human = Human.new

    expect(zombie.status).to eq('undead')
    expect(human.status).to eq('alive')

    zombie.bite(human)

    expect(human.status).to eq('undead')

    human.kill(zombie)

    expect(zombie.status).to eq('undead')
  end

  it 'cannot bite a human if killed by a human already' do
    zombie = Zombie.new
    human = Human.new

    expect(zombie.status).to eq('undead')
    expect(human.status).to eq('alive')

    human.kill(zombie)
    zombie.bite(human)

    expect(human.status).to eq('alive')
    expect(human.zombies_killed).to eq(1)

    expect(zombie.status).to eq('double-tapped')
    expect(zombie.people_turned).to eq(0)
  end
end
