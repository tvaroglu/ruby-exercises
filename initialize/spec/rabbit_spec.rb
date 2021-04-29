require 'rspec'
require_relative '../lib/rabbit'

RSpec.describe Rabbit do
  it 'exists' do
    ralph = Rabbit.new({name: "Ralph", num_syllables: 1})

    expect(ralph).to be_an_instance_of(Rabbit)
  end

  it 'has a name' do
    ralph = Rabbit.new({name: "Ralph", num_syllables: 1})

    expect(ralph.name).to eq("Ralph")
  end

  it "name ends with 'Rabbit' if 2 syllables" do
    ralph = Rabbit.new({name: "Ralph", num_syllables: 1})
    rita = Rabbit.new({name: "Rita", num_syllables: 2})

    expect(ralph.name).to eq("Ralph")
    expect(rita.name).to eq("Rita Rabbit")
  end

  it "name ends with 'the Rabbit' if 3 syllables" do
    roberto = Rabbit.new({name: "Roberto", num_syllables: 3})
    expect(roberto.name).to eq("Roberto the Rabbit")
  end

  it 'can be created with default params' do
    peter = Rabbit.new
    expect(peter.name).to eq('Peter Rabbit')
    expect(peter.num_syllables).to eq(2)
  end
end
