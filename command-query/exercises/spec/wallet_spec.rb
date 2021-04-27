require 'rspec'
require_relative '../lib/wallet'

RSpec.describe Wallet do
  it 'starts at zero' do
    wallet = Wallet.new

    expect(wallet.cents).to eq(0)
  end

  it 'can add pennies' do
    wallet = Wallet.new
    expect(wallet.cents).to eq(0)
    expect(wallet.wallet).to eq([])

    wallet << :penny
    expect(wallet.cents).to eq(1)
    expect(wallet.wallet).to eq([:penny])

    3.times { wallet << :penny }
    expect(wallet.cents).to eq(4)
    expect(wallet.wallet).to eq([:penny, :penny, :penny, :penny])
  end

  it 'can add nickels' do
    wallet = Wallet.new

    wallet << :nickel
    expect(wallet.cents).to eq(5)

    3.times { wallet << :nickel }
    expect(wallet.cents).to eq(20)
  end

  it 'can add dimes' do
    wallet = Wallet.new

    wallet << :dime
    expect(wallet.cents).to eq(10)

    3.times { wallet << :dime }
    expect(wallet.cents).to eq(40)
  end

  it 'can add quarters' do
    wallet = Wallet.new

    wallet << :quarter
    expect(wallet.cents).to eq(25)

    3.times { wallet << :quarter }
    expect(wallet.cents).to eq(100)
  end

  it 'can take coins out' do
    wallet = Wallet.new
    expect(wallet.cents).to eq(0)
    expect(wallet.wallet).to eq([])

    wallet << :penny
    wallet << :penny
    wallet << :penny
    wallet << :penny
    expect(wallet.cents).to eq(4)
    expect(wallet.wallet).to eq([:penny, :penny, :penny, :penny])

    wallet.take(:penny)
    expect(wallet.cents).to eq(3)
    expect(wallet.wallet).to eq([:penny, :penny, :penny])

    wallet.take(:penny, :penny)
    expect(wallet.wallet).to eq([:penny])
    expect(wallet.cents).to eq(1)

  end

  it 'can taake various coins out' do
    wallet = Wallet.new
    wallet << :penny
    wallet << :dime
    wallet << :quarter
    wallet << :quarter

    wallet.take(:dime, :quarter)
    expect(wallet.cents).to eq(26)
  end

  it 'ignores coins that arent there' do
    wallet = Wallet.new
    wallet << :penny
    wallet.take(:dime)

    expect(wallet.cents).to eq(1)
  end

  it 'can return dollar amounts' do
    wallet = Wallet.new
    expect(wallet.cents).to eq(0)
    expect(wallet.dollars).to eq(0.00)

    5.times { wallet << :full_dollar }
    expect(wallet.cents).to eq(500)
    expect(wallet.dollars).to eq(5.00)

    3.times { wallet.take(:full_dollar) }
    expect(wallet.cents).to eq(200)
    expect(wallet.dollars).to eq(2.00)

    11.times { wallet << :half_dollar }
    expect(wallet.cents).to eq(750)
    expect(wallet.dollars).to eq(7.50)

    3.times { wallet.take(:full_dollar) }
    expect(wallet.cents).to eq(550)
    expect(wallet.dollars).to eq(5.50)
  end
end
