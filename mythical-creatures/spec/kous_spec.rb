require 'rspec'
require_relative '../lib/kous/kous'
require_relative '../lib/kous/person'

RSpec.describe Kous do

  it 'has a full name' do
    kous = Kous.new
    expect(kous.full_name).to eq('Cinder')
  end

  it 'is furry by default' do
    kous = Kous.new
    expect(kous.furry?).to be true
  end

  it 'is not stressed by default' do
    kous = Kous.new
    expect(kous.stressed?).to be false
  end

  it 'can receive a treat' do
    kous = Kous.new
    person = Person.new
    expect(person.name).to eq('John')

    person.give_treat(kous, 'salmon')

    expect(kous.treats.length).to eq(1)
    expect(kous.treats.first).to eq('salmon')
  end

  it 'becomes stressed if a treat is taken away' do
    kous = Kous.new
    person = Person.new

    treats = ['salmon', 'shrimp tails']
    treats.each do |treat|
      person.give_treat(kous, treat)
    end

    expect(kous.treats.length).to eq(2)
    expect(kous.stressed?).to be false

    person.take_treat(kous, 'salmon')
    expect(kous.treats.length).to eq(1)
    expect(kous.stressed?).to be true
  end

  it 'plays differently with certain people' do
    kous = Kous.new
    stranger = Person.new
    talia = Person.new('Talia')
    cody = Person.new('Cody')
    taylor = Person.new('Taylor')

    expect(kous.play_with(stranger)).to eq('CVB infection!')
    expect(kous.play_with(talia)).to eq('nesting!')
    expect(kous.play_with(cody)).to eq('nesting!')
    expect(kous.play_with(taylor)).to eq("crab-monkey'ing!")
  end

  it 'becomes stressed after a bath' do
    kous = Kous.new
    expect(kous.stressed?).to be false

    kous.take_bath
    expect(kous.stressed?).to be true
  end

  it 'exhibits different playing behavior when stressed' do
    kous = Kous.new
    expect(kous.stressed?).to be false

    kous.take_bath
    expect(kous.stressed?).to be true

    person = Person.new('Cody')
    expect(kous.play_with(person)).to eq('peeing on the bed now!')
  end

  it 'is no longer stressed after a nap' do
    kous = Kous.new
    expect(kous.stressed?).to be false

    kous.take_bath
    expect(kous.stressed?).to be true

    kous.sleep
    expect(kous.stressed?).to be false
  end

  it 'digests all treats while asleep' do
    kous = Kous.new
    expect(kous.treats.length).to eq(0)

    person = Person.new
    person.give_treat(kous, 'chicken')
    expect(kous.treats.length).to eq(1)
    expect(kous.treats.first).to eq('chicken')

    kous.sleep
    expect(kous.treats.length).to eq(0)
    expect(kous.treats).to eq([])
  end

end
