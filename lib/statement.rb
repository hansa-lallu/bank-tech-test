require 'time'

class Statement
  attr_reader :account

  def initialize(account = Account.new)
    @account = account
  end

  def header
    'date || credit || debit || balance'
  end

  def sort_by_date
    @account.transactions.log.sort do |transaction_x, transaction_y| 
       Time.parse(transaction_y[0]) <=> Time.parse(transaction_x[0])
    end
  end
  
  def format(transactions)
    transactions.map { |transaction| transaction.join(' || ').gsub('  ', ' ')  }
  end
  
  def display
    puts header
    print format(sort_by_date).join("\n")
  end
end
