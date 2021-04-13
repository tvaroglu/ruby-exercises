require 'rspec'
require_relative '../lib/candy'

RSpec.describe Candy do
  it 'test 1: has a type' do
    candy = Candy.new('Skittles')

    expect(candy.type).to eq('Skittles')
  end

  it 'test 2: has a different kind of candy' do
    candy = Candy.new('Snickers')

    expect(candy.type).to eq('Snickers')
  end

  it 'test 3: existing candy has a changed candy type' do
    candy = Candy.new('M&Ms')
    candy.change_type('Twix')

    expect(candy.type).to eq('Twix')
  end
end
