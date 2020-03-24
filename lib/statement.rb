class Statement

  def initialize(transactions = Transaction.new)
    @transactions = transactions
  end

  def header
    "date || credit || debit || balance"
  end

  def print
    puts header
    @transactions.log.reverse.each { |transaction| puts transaction.join(' || ')  }
  end

end

