require 'rspec'
require_relative '../lib/direwolf/direwolf'
require_relative '../lib/direwolf/stark'

RSpec.describe Direwolf do
  it 'has a name' do
    wolf = Direwolf.new('Nymeria')

    expect(wolf.name).to eq('Nymeria')
  end

  it 'can have a different name and can have a home' do
    wolf = Direwolf.new('Lady')

    expect(wolf.home).to eq('Beyond the Wall')
    expect(wolf.name).to eq('Lady')
  end

  it 'is massive by default' do
    wolf = Direwolf.new('Ghost')

    expect(wolf.size).to eq('Massive')
    expect(wolf.name).to eq('Ghost')
  end

  it 'can have another home and be another size' do
    wolf = Direwolf.new('Shaggydog', "Winterfell", "Smol Pupper")

    expect(wolf.name).to eq('Shaggydog')
    expect(wolf.home).to eq('Winterfell')
    expect(wolf.size).to eq('Smol Pupper')
  end

  it 'the Starks are in Winterfell by default' do
    wolf = Direwolf.new('Summer', 'Winterfell')
    stark = Stark.new('Bran')

    expect(wolf.home).to eq('Winterfell')
    expect(stark.location).to eq('Winterfell')
  end

  it 'starts off with no Starks to protect' do
    wolf = Direwolf.new('Nymeria')
    stark = Stark.new('Arya')

    expect(wolf.starks_to_protect).to be_empty
  end

  it 'protects the Stark children' do
    wolf = Direwolf.new('Nymeria', 'Riverlands')
    stark = Stark.new('Arya', 'Riverlands')

    wolf.protects(stark)

    expect(wolf.starks_to_protect.first.name).to eq('Arya')
  end

  it 'can only protect the Stark Children if they are in the same location' do
    wolf = Direwolf.new('Ghost')
    stark = Stark.new('Jon', 'Kings Landing')

    wolf.protects(stark)

    expect(wolf.starks_to_protect).to be_empty
  end

  it 'can only protect two Starks at a time' do
    summer_wolf = Direwolf.new('Summer', "Winterfell")
    lady_wolf = Direwolf.new('Lady', "Winterfell")
    sansa_stark = Stark.new('Sansa')
    john_stark = Stark.new('Jon')
    rob_stark = Stark.new('Rob')
    bran_stark = Stark.new('Bran')
    arya_stark = Stark.new('Arya')

    summer_wolf.protects(sansa_stark)
    summer_wolf.protects(john_stark)
    lady_wolf.protects(rob_stark)
    lady_wolf.protects(bran_stark)
    lady_wolf.protects(arya_stark)

    expect(summer_wolf.starks_to_protect).to include(sansa_stark)
    expect(summer_wolf.starks_to_protect).to include(john_stark)
    expect(lady_wolf.starks_to_protect).to include(rob_stark)
    expect(lady_wolf.starks_to_protect).to include(bran_stark)
    expect(lady_wolf.starks_to_protect).to_not include(arya_stark)
  end

  it 'the Starks are unsafe by default' do
    stark = Stark.new('Jon', 'The Wall')

    expect(stark.safe?).to be false
    expect(stark.house_words).to eq('Winter is Coming')
  end

  it 'protects the Starks' do
    wolf = Direwolf.new('Nymeria', "Winterfell")
    arya_stark = Stark.new('Arya')
    sansa_stark = Stark.new('Sansa')

    wolf.protects(arya_stark)

    expect(arya_stark.safe?).to be true
    expect(sansa_stark.safe?).to be false
  end

  it 'hunts white walkers' do
    wolf = Direwolf.new('Nymeria', 'Winterfell')

    expect(wolf.hunts_white_walkers?).to be true
  end

  it 'will not hunt white walkers when protecting Starks' do
    wolf = Direwolf.new('Nymeria', "Winterfell")
    arya_stark = Stark.new('Arya')

    wolf.protects(arya_stark)

    expect(wolf.hunts_white_walkers?).to be false
  end

  it 'can leave and stop protecting Starks' do
    summer_wolf = Direwolf.new('Summer', "Winterfell")
    lady_wolf = Direwolf.new('Lady', "Winterfell")
    sansa_stark = Stark.new('Sansa')
    arya_stark = Stark.new('Arya')

    summer_wolf.protects(arya_stark)
    lady_wolf.protects(sansa_stark)
    summer_wolf.leaves(arya_stark)

    expect(summer_wolf.starks_to_protect).to eq([])
    expect(lady_wolf.starks_to_protect.first.name).to eq('Sansa')
    expect(arya_stark.safe?).to be false
  end

  it 'returns the Stark object when it leaves' do
    summer_wolf = Direwolf.new('Summer', "Winterfell")
    lady_wolf = Direwolf.new('Lady', "Winterfell")
    sansa_stark = Stark.new('Sansa')
    arya_stark = Stark.new('Arya')
    rickon_stark = Stark.new('Rickon')

    summer_wolf.protects(arya_stark)
    lady_wolf.protects(sansa_stark)
    summer_wolf.leaves(arya_stark)

    expected = lady_wolf.leaves(rickon_stark)

    expect(expected.name).to eq('Rickon')
  end

  it 'can release all Starks' do
    direwolf = Direwolf.new
    expect(direwolf.name).to eq('Aenocyon Dirus')
    expect(direwolf.home).to eq('Beyond the Wall')
    expect(direwolf.size).to eq('Massive')
    expect(direwolf.hunts_white_walkers?).to be true

    ned_stark = Stark.new
    expect(ned_stark.name).to eq('Eddard')
    expect(ned_stark.location).to eq('Winterfell')
    expect(ned_stark.safe?).to be false

    arya_stark = Stark.new('Arya', 'Beyond the Wall')
    expect(arya_stark.name).to eq('Arya')
    expect(arya_stark.location).to eq('Beyond the Wall')
    expect(arya_stark.safe?).to be false

    rickon_stark = Stark.new('Rickon', 'Beyond the Wall')
    expect(rickon_stark.name).to eq('Rickon')
    expect(rickon_stark.location).to eq('Beyond the Wall')
    expect(rickon_stark.safe?).to be false

    starks = [ned_stark, arya_stark, rickon_stark]
    starks.each do |stark|
      direwolf.protects(stark)
    end

    expect(direwolf.starks_to_protect.length).to eq(2)
    expect(direwolf.hunts_white_walkers?).to be false
    expect(direwolf.starks_to_protect.first.name).to eq('Arya')

    expect(ned_stark.safe?).to be false
    expect(arya_stark.safe?).to be true
    expect(rickon_stark.safe?).to be true

    direwolf.release_starks
    expect(direwolf.starks_to_protect.length).to eq(0)
    expect(direwolf.hunts_white_walkers?).to be true
  end

  it 'can change colors' do
    direwolf = Direwolf.new
    expect(direwolf.color).to eq('White')

    direwolf.change_color('grey')
    expect(direwolf.color).to eq('Grey')

    direwolf.change_color(123)
    expect(direwolf.color).to eq('Grey')
  end
end
