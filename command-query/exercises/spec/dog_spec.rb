require 'rspec'
require_relative '../lib/dog'

RSpec.describe Dog do
  it 'is hungry' do
    dog = Dog.new

    expect(dog.hungry?).to be true
  end

  it 'eats' do
    dog = Dog.new
    dog.eat

    expect(dog.hungry).to be false
  end

  it 'plays' do
    dog = Dog.new

    expect(dog.hungry?).to be true

    dog.eat

    expect(dog.hungry?).to be false

    dog.play

    expect(dog.hungry?).to be true
  end
end
