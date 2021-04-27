class Wallet
  attr_accessor :wallet, :valid_denominations, :cents

  def initialize()
    @wallet = Array.new
    @cents = 0
    @valid_denominations = {
      :penny => 1,
      :nickel => 5,
      :dime => 10,
      :quarter => 25,
      :half_dollar => 50,
      :full_dollar => 100
    }
  end

  def valid_denom?()
    return self.valid_denominations
  end

  def <<(money)
    if money.class == Symbol && valid_denom?.key?(money)
      wallet << money
    end
  end

  def cents()
    return wallet.reduce(0) do |total, denomination|
      total + self.valid_denominations[denomination]
    end
  end

  def dollars()
    return cents() / 100.00
  end

  def take(*coins)
    all_symbols = coins.all? do |coin|
      coin.class == Symbol
    end
    if all_symbols == true
      coins.length.times do |index|
        if self.wallet.index(coins[index]) != nil
          self.wallet.delete_at(self.wallet.index(coins[index]))
        end
      end
    end
  end

end
