require 'rspec'
require_relative '../lib/monkey'

RSpec.describe Monkey do
  it 'exists' do
    margaret = Monkey.new(["Margaret", "Bonobo", "Bananas"])

    expect(margaret).to be_an_instance_of(Monkey)
  end

  it 'has a name' do
    margaret = Monkey.new(["Margaret", "Bonobo", "Bananas"])

    expect(margaret.name).to eq("Margaret")
  end

  it 'has a type' do
    margaret = Monkey.new(["Margaret", "Bonobo", "Bananas"])

    expect(margaret.type).to eq("Bonobo")
  end

  it 'has a favorite_food' do
    margaret = Monkey.new(["Margaret", "Bonobo", "Bananas"])

    expect(margaret.favorite_food).to eq("Bananas")
  end

  it 'can supply default params based on supplied args' do
    george = Monkey.new
    expect(george.attributes).to eq(['Curious George', 'Barbary macaque', 'bananas'])

    cesar_str_arg = Monkey.new('Cesar')
    expect(cesar_str_arg.attributes).to eq(['Cesar', 'Barbary macaque', 'bananas'])

    cesar_arr_arg = Monkey.new(['Cesar'])
    expect(cesar_arr_arg.attributes).to eq(['Cesar', 'Barbary macaque', 'bananas'])

    kong = Monkey.new(['King Kong', 'Gorilla'])
    expect(kong.attributes).to eq(['King Kong', 'Gorilla', 'bananas'])
  end
end
