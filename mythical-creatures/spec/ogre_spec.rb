require 'rspec'
require_relative '../lib/ogre/ogre'
require_relative '../lib/ogre/human'

RSpec.describe Ogre do
  it 'has a name' do
    ogre = Ogre.new('Brak')
    expect(ogre.name).to eq('Brak')
  end

  it 'lives somewhere by default' do
    ogre = Ogre.new('Brak')
    expect(ogre.home).to eq('Swamp')
  end

  it 'doesnt have to live in a swamp' do
    ogre = Ogre.new('Brak', 'Castle')

    expect(ogre.home).to eq('Castle')
  end

  it 'can meets humans' do
    ogre = Ogre.new('Brak')
    human = Human.new
    expect(human.name).to eq('Jane')

    ogre.encounter(human)

    expect(human.encounter_counter).to eq(1)
  end

  it 'is noticed by humans every third encounter' do
    ogre = Ogre.new('Brak')
    human = Human.new

    ogre.encounter(human)
    ogre.encounter(human)
    expect(human.notices_ogre?).to be false

    ogre.encounter(human)

    expect(human.notices_ogre?).to be true
  end

  it 'is noticed by humans the sixth time' do
    ogre = Ogre.new('Brak')
    human = Human.new

    6.times { ogre.encounter(human) }

    expect(human.notices_ogre?).to be true
  end

  it 'can swing a club' do
    ogre = Ogre.new('Brak')
    human = Human.new

    ogre.swing_at(human)

    expect(ogre.swings).to eq(1)
  end

  it 'swings its club when noticed by a human' do
    ogre = Ogre.new('Brak')
    human = Human.new
    ogre.encounter(human)

    expect(ogre.swings).to eq(0)

    2.times { ogre.encounter(human) }

    expect(ogre.swings).to eq(1)
    expect(human.notices_ogre?).to be true
  end

  it 'hits the human every second time it swings' do
    ogre = Ogre.new('Brak')
    human = Human.new

    6.times { ogre.encounter(human) }

    expect(ogre.encounter_counter).to eq(6)
    expect(ogre.swings).to eq(2)
    expect(human.knocked_out?).to be true
  end

  it 'apologizes and the human wakes up' do
    ogre = Ogre.new('Brak')
    human = Human.new

    6.times { ogre.encounter(human) }

    expect(human.knocked_out?).to be true

    ogre.apologize(human)
    expect(human.knocked_out?).to be false
  end

  it 'can kill a human if it swings when the human is knocked out' do
    ogre = Ogre.new('Brak')
    human = Human.new
    expect(ogre.encounter_counter).to eq(0)
    expect(ogre.swings).to eq(0)
    expect(human.encounter_counter).to eq(0)
    expect(human.swung_at).to eq(0)
    expect(human.notices_ogre?).to be false
    expect(human.knocked_out?).to be false

    3.times { ogre.encounter(human) }
    expect(ogre.encounter_counter).to eq(3)
    expect(ogre.swings).to eq(1)
    expect(human.encounter_counter).to eq(3)
    expect(human.swung_at).to eq(1)
    expect(human.notices_ogre?).to be true
    expect(human.knocked_out?).to be false

    3.times { ogre.encounter(human) }
    expect(ogre.encounter_counter).to eq(6)
    expect(ogre.swings).to eq(2)
    expect(human.encounter_counter).to eq(6)
    expect(human.swung_at).to eq(2)
    expect(human.notices_ogre?).to be true
    expect(human.knocked_out?).to be true

    3.times { ogre.encounter(human) }
    expect(ogre.encounter_counter).to eq(9)
    expect(ogre.swings).to eq(3)
    expect(human.encounter_counter).to eq(9)
    expect(human.swung_at).to eq(3)
    expect(human.notices_ogre?).to be false
    expect(human.knocked_out?).to be true
    expect(human.dead?).to be true
  end

  it 'cannot apologize to a dead human' do
    ogre = Ogre.new('Brak')
    human = Human.new
    expect(ogre.encounter_counter).to eq(0)
    expect(ogre.swings).to eq(0)
    expect(human.encounter_counter).to eq(0)
    expect(human.swung_at).to eq(0)
    expect(human.notices_ogre?).to be false
    expect(human.knocked_out?).to be false

    9.times { ogre.encounter(human) }
    expect(ogre.encounter_counter).to eq(9)
    expect(ogre.swings).to eq(3)
    expect(human.encounter_counter).to eq(9)
    expect(human.swung_at).to eq(3)
    expect(human.notices_ogre?).to be false
    expect(human.knocked_out?).to be true
    expect(human.dead?).to be true

    expect(ogre.apologize(human)).to eq("whoops... that might've been a bit much...")
    expect(human.notices_ogre?).to be false
    expect(human.knocked_out?).to be true
    expect(human.dead?).to be true
  end
end
