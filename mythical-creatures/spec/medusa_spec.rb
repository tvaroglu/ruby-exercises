require 'rspec'
require_relative '../lib/medusa/medusa'
require_relative '../lib/medusa/person'

RSpec.describe Medusa do
  it 'has a name' do
    medusa = Medusa.new('Cassiopeia')
    expect(medusa.name).to eq('Cassiopeia')
  end

  it 'has no statues when created' do
    medusa = Medusa.new('Cassiopeia')
    expect(medusa.statues).to be_empty
  end

  it 'gains a statue when staring at a person' do
    medusa = Medusa.new('Cassiopeia')
    victim = Person.new('Perseus')

    medusa.stare(victim)
    expect(medusa.statues.count).to eq(1)
    expect(medusa.statues.first.name).to eq('Perseus')
    expect(medusa.statues.first).to be_an_instance_of(Person)
  end

  it 'turns a person to stone when staring at them' do
    medusa = Medusa.new('Cassiopeia')
    victim = Person.new('Perseus')

    expect(victim.stoned?).to be false
    medusa.stare(victim)
    expect(victim.stoned?).to be true
  end

  it 'can only have three victims' do
    medusa = Medusa.new
    expect(medusa.name).to eq('Medusa')

    victim_1 = Person.new
    expect(victim_1.name).to eq('Perseus')

    victim_2 = Person.new('Andromeda')
    expect(victim_2.name).to eq('Andromeda')

    victim_3 = Person.new('Aphrodite')
    expect(victim_3.name).to eq('Aphrodite')

    victims = [victim_1, victim_2, victim_3]
    victims.each do |victim|
      medusa.stare(victim)
    end
    expect(medusa.statues.length).to eq(3)

    victim_4 = Person.new('Taylor')
    expect(victim_4.name).to eq('Taylor')
    medusa.stare(victim_4)
    expect(medusa.statues.length).to eq(3)
  end

  it 'if a fourth victim is stoned the first is unstoned' do
    medusa = Medusa.new

    victim_1 = Person.new
    victim_2 = Person.new('Andromeda')
    victim_3 = Person.new('Aphrodite')

    victims = [victim_1, victim_2, victim_3]
    victims.each do |victim|
      medusa.stare(victim)
    end
    expect(medusa.statues.length).to eq(3)

    victim_4 = Person.new('Taylor')
    medusa.stare(victim_4)
    expect(medusa.statues.length).to eq(3)
    expect(victim_1.stoned?).to be false
    expect(victim_4.stoned?).to be true
  end

  it 'it can display her victims' do
    medusa = Medusa.new
    expect(medusa.victim_count).to eq(0)
    expect(medusa.statues.length).to eq(0)
    expect(medusa.display_victims).to eq(0)

    victim_1 = Person.new
    victim_2 = Person.new('Andromeda')
    victim_3 = Person.new('Aphrodite')

    medusa.stare(victim_1)
    expect(medusa.victim_count).to eq(1)
    expect(medusa.display_victims).to eq(1)
    expect(medusa.statues[0].name).to eq('Perseus')
    expect(medusa.statues[0].stoned?).to be true

    medusa.stare(victim_2)
    expect(medusa.victim_count).to eq(2)
    expect(medusa.display_victims).to eq(2)
    expect(medusa.statues[1].name).to eq('Andromeda')
    expect(medusa.statues[1].stoned?).to be true

    medusa.stare(victim_3)
    expect(medusa.victim_count).to eq(3)
    expect(medusa.display_victims).to eq(3)
    expect(medusa.statues[2].name).to eq('Aphrodite')
    expect(medusa.statues[2].stoned?).to be true

    victim_4 = Person.new('Taylor')
    medusa.stare(victim_4)
    expect(medusa.victim_count).to eq(4)
    expect(medusa.display_victims).to eq(3)
    expect(medusa.statues[0].name).to eq('Andromeda')
    expect(medusa.statues[0].stoned?).to be true
    expect(medusa.statues[1].name).to eq('Aphrodite')
    expect(medusa.statues[1].stoned?).to be true
    expect(medusa.statues[2].name).to eq('Taylor')
    expect(medusa.statues[2].stoned?).to be true

    expect(medusa.statues.include?(victim_1)).to be false
    expect(victim_1.stoned?).to be false
  end

  it 'triples the number of snakes in her hair after turning a set of 3 victims to stone' do
    medusa = Medusa.new
    expect(medusa.victim_count).to eq(0)
    expect(medusa.snakes_in_hair).to eq(3)

    victim_1 = Person.new
    victim_2 = Person.new('Andromeda')
    victim_3 = Person.new('Aphrodite')

    victims = [victim_1, victim_2, victim_3]
    victims.each do |victim|
      medusa.stare(victim)
    end
    expect(medusa.victim_count).to eq(3)
    expect(medusa.snakes_in_hair).to eq(9)

    new_people = ['Hansel', 'Gretel', 'Jack', 'Jill']
    new_people.each do |person|
      medusa.stare(Person.new(person))
    end
    expect(medusa.victim_count).to eq(7)
    expect(medusa.snakes_in_hair).to eq(27)
  end

end
