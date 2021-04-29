require 'rspec'
require_relative '../lib/iguana'

RSpec.describe Iguana do
  it 'exists' do
    iguana = Iguana.new

    expect(iguana).to be_an_instance_of(Iguana)
  end

  it 'starts with no colors' do
    iguana = Iguana.new

    expect(iguana.colors).to eq([])
  end

  it 'can set colors' do
    iguana = Iguana.new

    iguana.colors = ["Green", "Red", "White"]

    expect(iguana.colors).to eq(["Green", "Red", "White"])
  end

  it 'has a default current color' do
    iggy = Iguana.new

    expect(iggy.current_color?).to eq('Green')
    expect(iggy.colors.length).to eq(1)
  end

  it 'can change colors and current (default) color' do
    iggy = Iguana.new
    iggy.colors = ["Red", "White"]
    expect(iggy.current_color?).to eq('Red')

    iggy.change_colors('brown')
    expect(iggy.current_color?).to eq('Brown')
    expect(iggy.colors.length).to eq(3)

    iggy.change_colors(123)
    expect(iggy.current_color?).to eq('Brown')
    expect(iggy.colors.length).to eq(3)
  end
end
