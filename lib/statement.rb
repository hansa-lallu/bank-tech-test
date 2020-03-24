class Statement
  attr_reader :transactions

  def initialize(transactions = Transaction.new)
    @transactions = transactions
  end

  def header
    'date || credit || debit || balance'
  end

  def sort_by_date
    @transactions.reverse
  end
  
  def format(transactions)
    transactions.map { |transaction| transaction.join(' || ').gsub('  ', ' ')  }
  end
  
  def display
    puts header
    print format(sort_by_date).join("\n")
  end
end
