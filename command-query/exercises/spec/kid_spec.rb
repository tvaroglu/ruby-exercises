require 'rspec'
require_relative '../lib/kid'

RSpec.describe Kid do
  it 'has not eaten sugar' do
    kid = Kid.new

    expect(kid.grams_of_sugar_eaten).to eq(0)
  end

  it 'gets 5 grams from eating candy' do
    kid = Kid.new

    kid.eat_candy

    expect(kid.grams_of_sugar_eaten).to eq(5)

    5.times { kid.eat_candy }

    expect(kid.grams_of_sugar_eaten).to eq(30)
  end

  it 'is not hyperactive' do
    kid = Kid.new

    expect(kid.hyperactive?).to be false
  end

  it 'is hyperactive after 60 grams of sugar' do
    kid = Kid.new

    11.times { kid.eat_candy }

    expect(kid.hyperactive?).to be false

    kid.eat_candy

    expect(kid.hyperactive?).to be true
  end

  it 'resets blood sugar by taking insulin' do
    kid = Kid.new

    expect(kid.hyperactive?).to be false

    12.times { kid.eat_candy }

    expect(kid.hyperactive?).to be true
    expect(kid.grams_of_sugar_eaten).to eq(60)

    kid.take_insulin

    expect(kid.hyperactive?).to be false
    expect(kid.grams_of_sugar_eaten).to eq(0)
  end
end
