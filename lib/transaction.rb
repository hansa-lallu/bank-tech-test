class Transaction
  attr_reader :log

  def initialize
    @log = []
  end

  def enter_transaction(amount, balance, type)
    if type == :credit
      @log << [Time.now.strftime("%d/%m/%Y"), "#{amount.to_f}0", '', "#{balance.to_f}0"]
    else 
      @log << [Time.now.strftime("%d/%m/%Y"), '', "#{amount.to_f}0", "#{balance.to_f}0"]
    end
  end
end
