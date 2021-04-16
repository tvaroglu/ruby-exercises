require 'rspec'
require_relative '../lib/wizard'

RSpec.describe Wizard do
  it 'has a name' do
    wizard = Wizard.new('Eric')
    expect(wizard.name).to eq('Eric')
  end

  it 'has a different name' do
    wizard = Wizard.new('Alex')
    expect(wizard.name).to eq('Alex')
  end

  it 'is bearded by default' do
    wizard = Wizard.new('Ben')
    expect(wizard.bearded?).to be true
  end

  it 'is not always bearded' do
    wizard = Wizard.new('Valerie', bearded: false)
    expect(wizard.bearded?).to be false
  end

  it 'has root powers' do
    wizard = Wizard.new('Stella', bearded: false)
    expect(wizard.incantation('chown ~/bin')).to eq('sudo chown ~/bin')
  end

  it 'has many root powers' do
    wizard = Wizard.new('Sal', bearded: true)
    expect(wizard.incantation('rm -rf /home/mirandax')).to eq('sudo rm -rf /home/mirandax')
  end

  it 'starts rested' do
    wizard = Wizard.new
    expect(wizard.name).to eq('Merlin')
    expect(wizard.rested?).to be true
  end

  it 'can cast spells' do
    wizard = Wizard.new
    expect(wizard.cast).to eq('MAGIC MISSILE!')
    expect(wizard.cast('Wingardium Leviosa!')).to eq('WINGARDIUM LEVIOSA!')
  end

  it 'gets tired after casting three spells' do
    wizard = Wizard.new

    2.times do
      wizard.cast
    end
    expect(wizard.rested?).to be true

    wizard.cast
    expect(wizard.rested?).to be false
  end

  it 'has a white beard when tired' do
    wizard = Wizard.new
    expect(wizard.bearded?).to be true
    expect(wizard.beard_color).to eq('grey')
    expect(wizard.rested?).to be true

    3.times do
      wizard.cast
    end
    expect(wizard.beard_color).to eq('white')
    expect(wizard.rested?).to be false
  end

  it 'can sleep to reset spells cast and beard color' do
    wizard = Wizard.new
    expect(wizard.bearded?).to be true
    expect(wizard.beard_color).to eq('grey')
    expect(wizard.rested?).to be true

    3.times do
      wizard.cast
    end
    expect(wizard.beard_color).to eq('white')
    expect(wizard.rested?).to be false

    wizard.sleep
    expect(wizard.beard_color).to eq('grey')
    expect(wizard.rested?).to be true
  end

  it 'has no beard color to change when tired or rested' do
    wizard = Wizard.new('Harry', false)
    expect(wizard.bearded?).to be false
    expect(wizard.beard_color).to eq('none')
    expect(wizard.rested?).to be true

    3.times do
      wizard.cast
    end
    expect(wizard.beard_color).to eq('none')
    expect(wizard.rested?).to be false

    wizard.sleep
    expect(wizard.beard_color).to eq('none')
    expect(wizard.rested?).to be true
  end
end
