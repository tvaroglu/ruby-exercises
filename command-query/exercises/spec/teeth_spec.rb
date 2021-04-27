require 'rspec'
require_relative '../lib/teeth'

RSpec.describe Teeth do
  it 'isnt clean by default' do
    teeth = Teeth.new

    expect(teeth.clean?).to be false
  end

  it 'are clean after brushing them' do
    teeth = Teeth.new

    teeth.brush
    expect(teeth.clean?).to be true
  end

  it 'are dirty after eating' do
    teeth = Teeth.new

    expect(teeth.clean?).to be false

    teeth.brush

    expect(teeth.clean?).to be true

    teeth.eat

    expect(teeth.clean?).to be false
  end
end
