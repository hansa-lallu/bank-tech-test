class Transaction
  attr_reader :log

  def initialize
    @log = []
  end

  def enter_transaction(date = Time.now, amount, balance, type)
    if type == :credit
      @log << [date, "#{amount.to_f}0", '', "#{balance.to_f}0"]
    else
      @log << [date, '', "#{amount.to_f}0", "#{balance.to_f}0"]
    end
  end
end
