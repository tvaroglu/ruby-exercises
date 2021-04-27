require 'rspec'
require_relative '../lib/cupcakes/cupcake'
require_relative '../lib/cupcakes/cupcakes'

RSpec.describe Cupcakes do
  it 'has no sweetest when there are no cupcakes' do
    cupcakes = Cupcakes.new
    expect(cupcakes.sweetest).to be_nil
  end

  it 'has a sweetest with one cupcake' do
    cupcakes = Cupcakes.new
    cupcakes << Cupcake.new('Carrot', 5) # 5 grams of sugar

    expect(cupcakes.sweetest.flavor).to eq('Carrot')
  end

  it 'has a sweetest cupcake' do
    cupcakes = Cupcakes.new
    cupcakes << Cupcake.new('Carrot', 5)
    cupcakes << Cupcake.new('Caramel', 12)
    cupcakes << Cupcake.new('Chocolate', 8)

    expect(cupcakes.sweetest[:flavor]).to eq('Caramel')
  end

  it 'can empty the plate of cupcakes' do
    cupcakes = Cupcakes.new

    cupcakes << Cupcake.new('Carrot', 5)
    cupcakes << Cupcake.new('Caramel', 12)
    cupcakes << Cupcake.new('Chocolate', 8)

    cupcakes.clean_plate

    expect(cupcakes.cupcakes).to eq([])
  end
end
