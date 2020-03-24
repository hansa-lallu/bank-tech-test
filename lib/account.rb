require_relative 'transaction'

class Account
  attr_reader :balance, :transactions

  def initialize(transactions = Transaction.new)
    @balance = 0
    @transactions = transactions
  end

  def deposit(amount)
    raise 'Please enter a valid amount' if amount.is_a?(Integer) == false

    @balance += amount
    @transactions.enter_transaction(amount, @balance, :credit)
    @balance
  end

  def withdraw(amount)
    raise 'Please enter a valid amount' if amount.is_a?(Integer) == false

    @balance -= amount
    @transactions.enter_transaction(amount, @balance, :debit)
    @balance
  end
end
