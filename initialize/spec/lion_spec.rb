require 'rspec'
require_relative '../lib/lion'

RSpec.describe Lion do
  it 'exists' do
    lionel = Lion.new({name: "Lionel", sound: "roar"})

    expect(lionel).to be_an_instance_of(Lion)
  end

  it 'has a name' do
    lionel = Lion.new({name: "Lionel", sound: "roar"})

    expect(lionel.name).to eq("Lionel")
  end

  it 'has a sound' do
    lionel = Lion.new({name: "Lionel", sound: "roar"})

    expect(lionel.sound).to eq("roar")
  end

  it 'is created with default params if no args are supplied' do
    lion = Lion.new

    expect(lion.name).to eq("Azlan")
    expect(lion.sound).to eq("RAWR!!!")
  end
end
