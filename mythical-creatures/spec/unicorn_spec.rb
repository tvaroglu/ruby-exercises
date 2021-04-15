require 'rspec'
require_relative '../lib/unicorn'

RSpec.describe Unicorn do
  it 'has a name' do
    unicorn = Unicorn.new('Robert')
    expect(unicorn.name).to eq('Robert')
  end

  it 'is silver by default' do
    unicorn = Unicorn.new('Margaret')
    expect(unicorn.color).to eq('silver')
    expect(unicorn.silver?).to eq(true)
    expect(unicorn.silver?).to be true
  end

  it 'doesnt have to be silver' do
    unicorn = Unicorn.new('Barbara', 'purple')
    expect(unicorn.color).to eq('purple')
    expect(unicorn.silver?).to eq(false)
    expect(unicorn.silver?).to be false
  end

  it 'says sparkly stuff' do
    unicorn = Unicorn.new('Johnny')
    expect(unicorn.say('Wonderful!')).to eq('**;* Wonderful! **;*')
    expect(unicorn.say('I dont like you very much.')).to eq('**;* I dont like you very much. **;*')
  end

  it 'has a default energy level of 100' do
    unicorn = Unicorn.new('Charlie')
    expect(unicorn.energy_level).to eq(100)
  end

  it 'can gallop to deplete its energy level' do
    unicorn = Unicorn.new('Charlie')
    unicorn.gallop
    expect(unicorn.energy_level).to eq(90)
  end

  it 'can sleep to replenish its energy level' do
    unicorn = Unicorn.new('Charlie')
    expect(unicorn.energy_level).to eq(100)
    unicorn.gallop
    expect(unicorn.energy_level).to eq(90)
    unicorn.sleep
    expect(unicorn.energy_level).to eq(100)
  end

  it 'can change colors' do
    unicorn = Unicorn.new('Charlie', 'Black')
    expect(unicorn.name).to eq('Charlie')
    expect(unicorn.color).to eq('black')

    unicorn.change_colors('White')
    expect(unicorn.color).to eq('white')
  end

  it 'can only change colors to valid color names' do
    unicorn = Unicorn.new
    expect(unicorn.name).to eq('none')
    expect(unicorn.color).to eq('silver')

    unicorn.change_colors('Black')
    expect(unicorn.color).to eq('black')

    unicorn.change_colors(123)
    expect(unicorn.color).to eq('black')
  end
end
