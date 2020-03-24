class Transaction
  attr_reader :log

  def initialize
    @log = []
  end

  def entry(amount, balance, type)
    if type == :credit
      @log << [Time.now.strftime("%d/%m/%Y"), "#{amount}", '', "#{balance}"]
    end
  end
end 

