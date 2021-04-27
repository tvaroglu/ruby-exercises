require 'rspec'
require_relative '../lib/pills'

RSpec.describe Pills do
  it 'bottle starts with 60 pills' do
    pills = Pills.new

    expect(pills.count).to eq(60)
  end

  it 'it pops a pill' do
    pills = Pills.new

    pills.pop

    expect(pills.count).to eq(59)
  end

  it 'can be refilled' do
    pills = Pills.new

    expect(pills.count).to eq(60)

    30.times { pills.pop }

    expect(pills.count).to eq(30)

    pills.refill

    expect(pills.count).to eq(60)
  end
end
