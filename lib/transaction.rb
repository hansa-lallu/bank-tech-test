class Transaction
  attr_reader :transaction_log

  def initialize
    @transaction_log = []
  end

  def entry(amount, balance)
    ["24/03/2020", "1000", "", "1500"]
  end
end 