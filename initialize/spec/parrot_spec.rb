require 'rspec'
require_relative '../lib/parrot'

RSpec.describe Parrot do
  it 'exists' do
    words = ["Sugar", "Flashy", "Giant", "Whisper"]
    perry = Parrot.new({name: "Perry", known_words: words})

    expect(perry).to be_an_instance_of(Parrot)
  end

  it 'has a name' do
    words = ["Sugar", "Flashy", "Giant", "Whisper"]
    perry = Parrot.new({name: "Perry", known_words: words})

    expect(perry.name).to eq("Perry")
  end

  it 'has a sound' do
    words = ["Sugar", "Flashy", "Giant", "Whisper"]
    perry = Parrot.new({name: "Perry", known_words: words})

    expect(perry.sound).to eq('Squawk!')
  end

  it 'knows words' do
    words = ["Sugar", "Flashy", "Giant", "Whisper"]
    perry = Parrot.new({name: "Perry", known_words: words})

    expect(perry.known_words).to eq(["Sugar", "Flashy", "Giant", "Whisper"])
  end

  it 'can be created with default params' do
    alex = Parrot.new

    expect(alex.name).to eq('Alex')
    expect(alex.known_words.class).to eq(Array)
    expect(alex.known_words.length).to eq(1)
    expect(alex.known_words.first && alex.sound).to eq('Squawk!')
  end
end
