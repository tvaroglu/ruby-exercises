require 'rspec'
require_relative '../lib/music'

RSpec.describe Music do
  it 'is not loud' do
    music = Music.new

    expect(music.loud?).to be false
  end

  it 'is loud after turning up the volume' do
    music = Music.new

    music.turn_up

    expect(music.loud?).to be true
  end

  it 'is quiet after turning down the volume' do
    music = Music.new

    expect(music.loud?).to be false

    music.turn_up

    expect(music.loud?).to be true

    music.turn_down

    expect(music.loud?).to be false
  end
end
