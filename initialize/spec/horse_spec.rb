require 'rspec'
require_relative '../lib/horse'

RSpec.describe Horse do
  it 'exists' do
    harry = Horse.new("Harry")

    expect(harry).to be_an_instance_of(Horse)
  end

  it 'has a name' do
    harry = Horse.new("Harry")

    expect(harry.name).to eq("Harry")
  end

  it 'starts with empty diet' do
    harry = Horse.new("Harry")

    expect(harry.diet).to eq([])
  end

  it 'can add to diet' do
    harry = Horse.new("Harry")

    harry.add_to_diet("Hay")
    harry.add_to_diet("Sugar Cubes")

    expect(harry.diet).to eq(["Hay", "Sugar Cubes"])
  end

  it 'can digest food' do
    horse = Horse.new

    expect(horse.name).to eq('Seabiscuit')

    foods = ['Hay', 'Sugar Cubes', 'Carrots']
    foods.each do |food|
      horse.add_to_diet(food)
    end

    expect(horse.diet.length).to eq(3)

    horse.digest

    expect(horse.diet.length).to eq(0)
    expect(horse.diet).to eq([])
  end
end
