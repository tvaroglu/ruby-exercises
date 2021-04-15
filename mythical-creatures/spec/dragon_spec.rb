require 'rspec'
require_relative '../lib/dragon'

RSpec.describe Dragon do
  it 'has a name' do
    dragon = Dragon.new('Ramoth', :gold, 'Lessa')
    expect(dragon.name).to eq('Ramoth')
  end

  it 'has a rider' do
    dragon = Dragon.new('Ramoth', :gold, 'Lessa')
    expect(dragon.rider).to eq('Lessa')
  end

  it 'has a color' do
    dragon = Dragon.new('Ramoth', :gold, 'Lessa')
    expect(dragon.color).to eq(:gold)
  end

  it 'is a different dragon' do
    dragon = Dragon.new('Mnementh', :bronze, 'Flar')
    expect(dragon.name).to eq('Mnementh')
  end

  it 'has a different rider' do
    dragon = Dragon.new('Mnementh', :bronze, 'Flar')
    expect(dragon.rider).to eq('Flar')
  end

  it 'has a different color' do
    dragon = Dragon.new('Mnementh', :bronze, 'Flar')
    expect(dragon.color).to eq(:bronze)
  end

  it 'was born hungry' do
    dragon = Dragon.new('Mnementh', :bronze, 'Flar')
    expect(dragon.hungry?).to be true
  end

  it 'eats a lot' do
    dragon = Dragon.new('Mnementh', :bronze, 'Flar')
    expect(dragon.hungry?).to be true
    dragon.eat
    expect(dragon.hungry?).to be true
    dragon.eat
    expect(dragon.hungry?).to be true
    dragon.eat
    expect(dragon.hungry?).to be false
  end

  it 'can digest after eating a lot' do
    dragon = Dragon.new
    expect(dragon.name).to eq('Smaug')
    expect(dragon.color).to eq(:gold)
    expect(dragon.rider).to eq('none')

    expect(dragon.hungry?).to be true
    dragon.eat
    expect(dragon.hungry?).to be true
    dragon.eat
    expect(dragon.hungry?).to be true
    dragon.eat
    expect(dragon.hungry?).to be false
    dragon.digest
    expect(dragon.hungry?).to be true
  end

  it 'can collect treasures' do
    dragon = Dragon.new
    expect(dragon.treasures).to eq([])
    expect(dragon.treasures.length). to eq(0)

    treasures = [
      'gold', 'jewels', 'coins'
    ]
    treasures.each do |treasure|
      dragon.treasures << treasure
    end

    expect(dragon.treasures).to eq(treasures)
    expect(dragon.treasures.length).to eq(3)
  end

  it 'can display treasures' do
    dragon = Dragon.new
    expect(dragon.display_treasures).to eq([])

    treasures = [
      'gold', 'jewels', 'coins'
    ]
    treasures.each do |treasure|
      dragon.treasures << treasure
    end

    expect(dragon.display_treasures).to eq(treasures)
  end

  it 'can get rid of all treasures' do
    dragon = Dragon.new
    expect(dragon.display_treasures).to eq([])

    treasures = [
      'gold', 'jewels', 'coins'
    ]
    treasures.each do |treasure|
      dragon.treasures << treasure
    end

    expect(dragon.display_treasures).to eq(treasures)

    dragon.devour_treasures

    expect(dragon.display_treasures).to eq([])
  end
end
