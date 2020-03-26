require 'statement'
require 'date'

describe Statement do
  let(:transactions) { double :transactions }
  let(:account) { double :account }

  it 'prints a header' do
    expect(subject.header).to eq('date || credit || debit || balance')
  end

  describe '#format' do
    it 'formats the transaction logs' do
      date = Time.now
      date_2 = Time.now

      allow(transactions).to receive(:log).and_return([[date, '', '500.00', '2500.00'], [date_2, '2000.00', '', '3000.00']])
      allow(account).to receive(:transactions).and_return(transactions)

      statement = Statement.new(account)
      expect(statement.format(statement.account.transactions.log)).to eq(["#{date.strftime('%d/%m/%Y')} || || 500.00 || 2500.00", "#{date_2.strftime('%d/%m/%Y')} || 2000.00 || || 3000.00"])
    end
  end

  describe '#sort_by_date' do
    it 'formats transactions by date in desc order' do
      date = Time.now
      date_1_days_ahead = Time.now + (60 * 60 * 24)
      date_2_days_ahead = Time.now + (60 * 60 * 24 * 2)
      
      allow(transactions).to receive(:log).and_return([[date, '', '500.00', '2500.00'], [date_1_days_ahead, '2000.00', '', '3000.00'], [date_2_days_ahead, '2000.00', '', '3000.00']])
      allow(account).to receive(:transactions).and_return(transactions)

      statement = Statement.new(account)
      expect(statement.sort_by_date).to eq([[date_2_days_ahead, '2000.00', '', '3000.00'], [date_1_days_ahead, '2000.00', '', '3000.00'], [date, '', '500.00', '2500.00']])
    end
  end

  describe '#display' do
    it 'prints a statement from most recent transactions first' do
      date = Time.now
      date_1_days_ahead = Time.now + (60 * 60 * 24)

      allow(transactions).to receive(:log).and_return([[date, '2000.00', '', '3000.00'], [date_1_days_ahead, '', '500.00', '2500.00']])
      allow(account).to receive(:transactions).and_return(transactions)

      statement = Statement.new(account)
      expect { statement.display }.to output("date || credit || debit || balance\n#{date_1_days_ahead.strftime('%d/%m/%Y')} || || 500.00 || 2500.00\n#{date.strftime('%d/%m/%Y')} || 2000.00 || || 3000.00").to_stdout
    end
  end
end
