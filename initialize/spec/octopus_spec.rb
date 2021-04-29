require 'rspec'
require_relative '../lib/eel'
require_relative '../lib/narwhal'
require_relative '../lib/octopus'

RSpec.describe Octopus do
  it 'exists' do
    nancy = Narwhal.new({cute: true, weight: 500, name: "Nancy"})
    orville = Octopus.new("Orville", nancy)

    expect(orville).to be_an_instance_of(Octopus)
  end

  it 'has a name' do
    nancy = Narwhal.new({cute: true, weight: 500, name: "Nancy"})
    orville = Octopus.new("Orville", nancy)

    expect(orville.name).to eq("Orville")
  end

  it 'has an animal as a friend' do
    nancy = Narwhal.new({cute: true, weight: 500, name: "Nancy"})
    orville = Octopus.new("Orville", nancy)

    expect(orville.friend).to eq(nancy)
  end

  it 'can have any animal as a friend' do
    eel = Eel.new("Earl")
    orville = Octopus.new("Orville", eel)

    expect(orville.friend).to eq(eel)
  end

  it 'can be created with default params' do
    paul = Octopus.new
    expect(paul.name).to eq('Paul')
    expect(paul.friend.name).to eq('Gnarwall')
  end

  it 'can add multiple friends' do
    paul = Octopus.new
    paul.add_friend(Eel.new)

    expect(paul.friends?.length).to eq(2)
    expect(paul.friends?.first.name).to eq('Gnarwall')
    expect(paul.friends?.last.name).to eq('just another eel')
  end

  it 'can unfriend current friends (that exist!)' do
    paul = Octopus.new
    paul.add_friend('random squid')

    expect(paul.friends?.length).to eq(2)
    expect(paul.friends?.first.name).to eq('Gnarwall')
    expect(paul.friends?.last).to eq('random squid')

    paul.unfriend('random squid')
    expect(paul.friends?.length).to eq(1)
    expect(paul.friends?.first.name).to eq('Gnarwall')

    paul.unfriend(123)
    expect(paul.friends?.length).to eq(1)
    expect(paul.friends?.first.name).to eq('Gnarwall')

    paul.unfriend('random squid')
    expect(paul.friends?.length).to eq(1)
    expect(paul.friends?.first.name).to eq('Gnarwall')

    paul.unfriend('Gnarwall')
    expect(paul.friends?.length).to eq(0)
    expect(paul.friends?).to eq([])
  end
end
