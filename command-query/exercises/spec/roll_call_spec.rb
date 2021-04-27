require 'rspec'
require_relative '../lib/roll_call'

RSpec.describe RollCall do
  it 'has no names' do
    roll_call = RollCall.new
    expect(roll_call.longest_name).to be nil
  end

  it 'has a longest of one' do
    roll_call = RollCall.new

    roll_call << 'Oda'

    expect(roll_call.longest_name).to eq('Oda')
  end

  it 'has longest of several' do
    roll_call = RollCall.new
    roll_call << "Ann"
    roll_call << "Alexandra"
    roll_call << "Roger"

    expect(roll_call.longest_name).to eq('Alexandra')
  end

  it 'can be reset' do
    roll_call = RollCall.new
    expect(roll_call.names.length).to eq(0)
    expect(roll_call.names).to eq([])

    names = ['Jim', 'Bob', 'Brian']
    names.each do |name|
      roll_call << name
    end

    expect(roll_call.names.length).to eq(3)
    expect(roll_call.names).to eq(['Jim', 'Bob', 'Brian'])

    roll_call.reset

    expect(roll_call.names.length).to eq(0)
    expect(roll_call.names).to eq([])
  end
end
