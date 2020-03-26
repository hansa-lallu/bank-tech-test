require 'transaction'

describe Transaction do
  
  describe '#initialize' do
    it 'has an empty transaction log on initalization' do
      expect(subject.log).to eq([])
    end
  end

  describe '#enter_transation' do
    it 'logs a transaction correctly' do
        date = Time.now
        amount = 1000.00
        balance = 1500.00

        expect(subject.enter_transaction(date, amount, balance, :credit)).to eq([[date, '1000.00', '', '1500.00']])
    end

    it 'logs two entries correctly' do
        date = Time.now
        subject.enter_transaction(date, 1000, 1500, :credit)

        date_2 = Time.now
        expect(subject.enter_transaction(date_2, 200, 1300, :debit)).to eq([[date, '1000.00', '', '1500.00'], [date_2, '', '200.00', '1300.00']])
    end
  end
end
