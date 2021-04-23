RSpec.describe 'zip' do

  it 'speed interview pairs' do
    list1 = ["Alice", "Bob", "Charlie"]
    list2 = ["Xenia", "Yves", "Zach"]
    pairs = list1.zip(list2)

    expect(pairs).to eq([["Alice", "Xenia"], ["Bob", "Yves"], ["Charlie", "Zach"]])
  end

  it 'test menu' do
    list1 = ["NY Strip Steak", "Lamb Stew", "Grilled Salmon"]
    list2 = [29, 23, 26]
    prices = list1.zip(list2)

    expect(prices).to eq([["NY Strip Steak", 29], ["Lamb Stew", 23], ["Grilled Salmon", 26]])
  end

  it 'lottery tickets' do
    list1 = ["Alice", "Bob", "Charlie"]
    list2 = [298, 166, 237]
    tickets = list1.zip(list2)

    expect(tickets).to eq([["Alice", 298], ["Bob", 166], ["Charlie", 237]])
  end

  it 'equivalent dna sequences' do
    strand1 = ["G", "A", "T", "T", "A", "C", "A"]
    strand2 = ["G", "A", "T", "G", "A", "C", "A"]
    pairs = strand1.zip(strand2)

    expect(pairs).to eq([["G", "G"], ["A", "A"], ["T", "T"], ["T", "G"], ["A", "A"], ["C", "C"], ["A", "A"]])
  end

  it 'solitaire' do
    list1 = ["Ace", "6", "10", "Queen"]
    list2 = [:clubs, :diamonds, :hearts, :spades]
    cards = list1.zip(list2)

    expect(cards).to eq([["Ace", :clubs], ["6", :diamonds], ["10", :hearts], ["Queen", :spades]])
  end

  it 'colors' do
    list1 = ["shoes", "tie", "umbrella"]
    list2 = ["red", "pink", "black"]
    fashion = list1.zip(list2)
    
    expect(fashion).to eq([["shoes", "red"], ["tie", "pink"], ["umbrella", "black"]])
  end

end
