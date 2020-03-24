class Account
  attr_reader :balance

  def initialize(transaction = Transaction.new)
    @balance = 0
    @transaction = transaction
  end

  def deposit(amount)
    raise 'Please enter a valid amount' if amount.is_a?(Integer) == false

    @balance += amount
    @transaction.entry(amount, @balance, :credit)
    @balance
  end

  def withdraw(amount)
    raise 'Please enter a valid amount' if amount.is_a?(Integer) == false
    raise 'You do not have enough money to withdraw' unless @balance >= amount

    @balance -= amount
    @transaction.entry(amount, @balance, :debit)
    @balance
  end
end

