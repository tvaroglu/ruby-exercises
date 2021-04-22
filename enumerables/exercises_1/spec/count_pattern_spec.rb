RSpec.describe 'Count Pattern Test' do

  it 'counts words with an e' do
    words = ["thing", "phone", "bark", "belt", "shoe", "bath"]
    tally = 0
    words.each do |word|
      tally += 1 if word.include?('e')
    end

    expect(tally).to eq(3)
  end

  it 'counts numbers greater than 17' do
    numbers = [9, 18, 12, 17, 1, 3, 99]
    tally = 0
    numbers.each do |number|
      if number > 17
        tally += 1
      end
    end

    expect(tally).to eq(2)
  end

  it 'words that are uppercase' do
    words = ["trousers", "SOCKS", "sweater", "Cap", "SHOE", "TIE"]
    tally = 0
    words.each do |word|
      if word == word.upcase
        tally += 1
      end
    end

    expect(tally).to eq(3)
  end

  it 'words ending in ing' do
    words = ["thought", "brake", "shin", "juice", "trash"]
    tally = 0
    words.each do |word|
      if word[-3..1] == 'ing'
        tally += 1
      end
    end

    expect(tally).to eq(0)
  end

  it 'even numbers' do
    numbers = [9, 2, 1, 3, 18, 39, 71, 4, 6]
    tally = 0
    numbers.each do |number|
      if number % 2 == 0
        tally += 1
      end
    end

    expect(tally).to eq(4)
  end

  it 'multiples of 5' do
    numbers = [2, 5, 19, 25, 35, 67]
    tally = 0
    numbers.each do |number|
      if number % 5 == 0
        tally += 1
      end
    end

    expect(tally).to eq(3)
  end

  it 'round prices' do
    prices = [1.0, 3.9, 5.99, 18.5, 20.0]
    tally = 0
    prices.each do |price|
      if price.to_s.split('.')[1] == '0' || price.to_s.split('.')[1] == '00'
        tally += 1
      end
    end

    expect(tally).to eq(2)
  end

  it 'four letter words' do
    words = ["bake", "bark", "corn", "apple", "wart", "bird", "umbrella", "fart"]
    tally = 0
    words.each do |word|
      if word.length == 4
        tally += 1
      end
    end
    
    expect(tally).to eq(6)
  end

end
