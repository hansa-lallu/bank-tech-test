class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    raise 'Please enter a valid amount' if amount.is_a?(Integer) == false

    @balance += amount
  end

  def withdraw(amount)
    raise 'Please enter a valid amount' if amount.is_a?(Integer) == false
    raise 'You do not have enough money to withdraw' unless @balance >= amount

    @balance -= amount
  end
end
