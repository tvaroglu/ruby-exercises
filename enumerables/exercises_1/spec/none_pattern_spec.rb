RSpec.describe 'none pattern' do

  it 'none are broken' do
    things = ["functional", "working", "works", "fixed", "good"]
    none_broken = true
    things.each do |thing|
      none_broken = false if thing == "broken"
    end
    expect(none_broken).to eq(true)
  end

  it 'double negative' do
    numbers = [9, 3, 3, 7, 6, -5, 1]
    not_none_negative = true
    numbers.each do |number|
      not_none_negative = false if number.to_s[0] == '-'
    end

    expect(not_none_negative).to eq(false)
  end

  it 'none are negative' do
    numbers = [9, 3, 1, 8, 3, 3, 5]
    none_negative = true
    numbers.each do |number|
      none_negative = false if number < 0
    end

    expect(none_negative).to eq(true)
  end

  it 'none shall pass' do
    critters = ["elf", "hobbit", "dwarf", "wizard", "human"]
    none_shall_pass = true
    critters.each do |critter|
      none_shall_pass = false if critter.include?('pass')
    end
    expect(none_shall_pass).to eq(true)
  end

  it 'one or more shall pass' do
    phrases = ["go", "left", "can cross", "shall pass", "must stay", "tarried"]
    none_shall_pass = true
    phrases.each do |phrase|
      none_shall_pass = false if phrase.include?('pass')
    end

    expect(none_shall_pass).to eq(false)
  end

  it 'none even' do
    numbers = [3, 9, 15, 21, 19]
    none_even = true
    numbers.each do |number|
      none_even = false if number % 2 == 0
    end
    
    expect(none_even).to eq(true)
  end
end
