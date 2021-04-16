require 'rspec'
require_relative '../lib/werewolf/werewolf'
require_relative '../lib/werewolf/victim'

RSpec.describe Werewolf do
  it 'has a name' do
    werewolf = Werewolf.new('David')
    expect(werewolf.name).to eq('David')
  end

  it 'has a location' do
    werewolf = Werewolf.new('David', 'London')
    expect(werewolf.location).to eq('London')
  end

  it 'is by default human' do
    werewolf = Werewolf.new('David', 'London')
    expect(werewolf.human?).to be true
  end

  it 'when starting as a human, changing makes it turn into a werewolf' do
    werewolf = Werewolf.new('David', 'London')
    werewolf.change!
    expect(werewolf.wolf?).to be true
    expect(werewolf.human?).to be false
  end

  it 'when starting as a human, changing again makes it be human again' do
    werewolf = Werewolf.new('David', 'London')
    expect(werewolf.human?).to be true

    werewolf.change!

    expect(werewolf.human?).to be false

    werewolf.change!

    expect(werewolf.human?).to be true
  end

  it 'when starting as a werewolf, changing a second time makes it a werewolf' do
    werewolf = Werewolf.new('David', 'London')

    werewolf.change!
    expect(werewolf.wolf?).to be true

    werewolf.change!
    werewolf.change!

    expect(werewolf.wolf?).to be true
  end

  it 'is not hungry by default' do
    werewolf = Werewolf.new
    expect(werewolf.name).to eq('David')
    expect(werewolf.location).to eq('London')
    expect(werewolf.hungry?).to be false
  end

  it 'becomes hungry after changing to a werewolf' do
    werewolf = Werewolf.new
    expect(werewolf.hungry?).to be false

    werewolf.change!
    expect(werewolf.hungry?).to be true
  end

  # class Victim
  #   attr_accessor :status
  #
  #   def initialize
  #     @status = :alive
  #   end
  # end

  it 'consumes a victim' do
    werewolf = Werewolf.new
    expect(werewolf.stomach.length).to eq(0)
    victim = Victim.new
    expect(victim.status).to eq(:alive)

    werewolf.change!
    werewolf.consume(victim)
    expect(werewolf.stomach.length).to eq(1)
    expect(victim.status).to eq(:dead)
  end

  it 'cannot consume a victim if it is in human form' do
    werewolf = Werewolf.new
    expect(werewolf.stomach.length).to eq(0)
    victim = Victim.new
    expect(victim.status).to eq(:alive)

    werewolf.consume(victim)
    expect(werewolf.stomach.length).to eq(0)
    expect(victim.status).to eq(:alive)
  end

  it 'a werewolf that has consumed a human being is no longer hungry' do
    werewolf = Werewolf.new
    expect(werewolf.human?).to be true
    expect(werewolf.wolf?).to be false
    expect(werewolf.hungry?).to be false
    expect(werewolf.stomach.length).to eq(0)

    victim = Victim.new
    expect(victim.status).to eq(:alive)

    werewolf.change!
    expect(werewolf.human?).to be false
    expect(werewolf.wolf?).to be true
    expect(werewolf.hungry?).to be true

    werewolf.consume(victim)
    expect(victim.status).to eq(:dead)

    expect(werewolf.human?).to be false
    expect(werewolf.wolf?).to be true
    expect(werewolf.hungry?).to be false
    expect(werewolf.stomach.length).to eq(1)
  end

  it 'a werewolf who has consumed a victim makes the victim dead' do
    werewolf = Werewolf.new
    expect(werewolf.stomach.length).to eq(0)
    victim = Victim.new
    expect(victim.status).to eq(:alive)

    werewolf.change!
    werewolf.consume(victim)
    expect(werewolf.stomach.length).to eq(1)
    expect(victim.status).to eq(:dead)
  end

  it 'can track how many victims it has consumed' do
    werewolf = Werewolf.new
    expect(werewolf.victims_consumed).to eq(0)

    victim_1 = Victim.new
    victim_2 = Victim.new

    werewolf.change!

    werewolf.consume(victim_1)
    expect(werewolf.victims_consumed).to eq(1)
    werewolf.consume(victim_2)
    expect(werewolf.victims_consumed).to eq(2)
  end

  it 'gets killed if it tries to consume a victim in human form' do
    werewolf = Werewolf.new
    expect(werewolf.victims_consumed).to eq(0)
    expect(werewolf.stomach).to eq([])
    expect(werewolf.human?).to be true
    expect(werewolf.status).to eq('alive')
    expect(werewolf.wolf?).to be false
    expect(werewolf.hungry?). to be false

    victim = Victim.new
    expect(victim.status).to eq(:alive)

    werewolf.consume(victim)
    expect(werewolf.victims_consumed).to eq(0)
    expect(werewolf.stomach).to eq([])
    expect(werewolf.human?).to be false
    expect(werewolf.status).to eq('dead')
    expect(werewolf.wolf?).to be false
    expect(werewolf.hungry?). to be false
  end
end
