class Transaction
  attr_reader :log

  def initialize
    @log = []
  end

  def enter_transaction(amount, balance, type)
    if type == :credit
      @log << [Time.now.strftime("%d/%m/%Y"), "#{amount}", '', "#{balance}"]
    else 
      @log << [Time.now.strftime("%d/%m/%Y"), '', "#{amount}", "#{balance}"]
    end
  end
end
