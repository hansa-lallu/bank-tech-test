require 'transaction'
require 'timecop'

describe Transaction do

  describe '#initialize' do 
    it 'has an empty transaction log on initalization' do 
      expect(subject.transaction_log).to eq([])
    end 
  end

  describe '#entry' do
    it 'logs an entry correctly' do 
      Timecop.freeze do
        date = Time.now.strftime("%d/%m/%Y")
        amount = 1000
        balance = 500
        expect(subject.entry(amount, balance)).to eq(["#{date}","1000", '', "1500"])
      end
    end 
  end
end