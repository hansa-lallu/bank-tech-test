class Transaction
  attr_reader :transaction_log

  def initialize
    @transaction_log = []
  end
end 