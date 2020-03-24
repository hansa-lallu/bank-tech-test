require 'transaction'
require 'timecop'

describe Transaction do

  describe '#initialize' do
    it 'has an empty transaction log on initalization' do
      expect(subject.log).to eq([])
    end
  end

  describe '#enter_transation' do
    it 'logs a transaction correctly' do
      Timecop.freeze do
        date = Time.now.strftime("%d/%m/%Y")
        amount = 1000
        balance = 1500

        expect(subject.enter_transaction(amount, balance, :credit)).to eq([["#{date}", '1000', '', '1500']])
      end
    end

    it 'logs two entries correctly' do
      Timecop.freeze do
        date = Time.now.strftime("%d/%m/%Y")
        subject.enter_transaction(1000, 1500, :credit)
        expect(subject.enter_transaction(200, 1300, :debit)).to eq([["#{date}", '1000', '', '1500'], ["#{date}", '', '200', '1300']])
      end
    end
  end
end
