require 'rspec'
require_relative '../lib/hydra'
require_relative '../lib/medusa/person'

RSpec.describe Hydra do
  it 'has a name' do
    hydra = Hydra.new
    expect(hydra.name).to eq('Lernaean Hydra')
  end

  it 'can have a different name' do
    hydra = Hydra.new('Gary')
    expect(hydra.name).to eq('Gary')
  end

  it 'has 9 heads by default' do
    hydra = Hydra.new
    expect(hydra.heads).to eq(9)
  end

  it 'can have a different number of heads' do
    hydra = Hydra.new('Gary', 5)
    expect(hydra.heads).to eq(5)
  end

  it 'is immortal' do
    hydra = Hydra.new
    expect(hydra.immortal).to be true
  end

  it 'can consume a person' do
    hydra = Hydra.new
    person = Person.new

    expect(hydra.stomach.length).to eq(0)
    expect(hydra.stomach).to eq([])

    expect(person.status).to eq('alive')

    hydra.consume(person)
    expect(hydra.stomach.length).to eq(1)

    expect(person.status).to eq('dead')
  end

  it 'gains a head when it consumes a person' do
    hydra = Hydra.new

    people = []
    3.times do
      person = Person.new
      people << person
    end
    expect(people.length).to eq(3)

    expect(hydra.stomach.length).to eq(0)
    expect(hydra.stomach).to eq([])
    expect(hydra.heads).to eq(9)

    people.each do |person|
      hydra.consume(person)
    end

    expect(hydra.stomach.length).to eq(3)
    expect(hydra.heads).to eq(12)
  end
end
