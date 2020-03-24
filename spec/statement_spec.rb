require 'statement'

describe Statement do
  let(:transactions) { double :transactions }

  it 'prints a header' do
    expect(subject.header).to eq('date || credit || debit || balance')
  end

  describe '#format' do
    it 'formats the transaction logs' do
      allow(transactions).to receive(:log).and_return([['23/03/2020', '', '500.00', '2500.00'], ['24/03/2020', '2000.00', '', '3000.00']])
      statement = Statement.new(transactions)

      expect(statement.format(statement.transactions.log)).to eq(['23/03/2020 || || 500.00 || 2500.00', '24/03/2020 || 2000.00 || || 3000.00'])
    end
  end

  describe '#sort_by_date' do
    it 'formats transactions by date in desc order' do
      statement = Statement.new([['13/02/2020', '', '500.00', '2500.00'], ['24/03/2020', '2000.00', '', '3000.00']])

      expect(statement.sort_by_date).to eq([['24/03/2020', '2000.00', '', '3000.00'], ['13/02/2020', '', '500.00', '2500.00']])
    end
  end

  describe '#display' do
    it 'prints a statement from most recent transactions first' do
      statement = Statement.new([['23/03/2020', '2000.00', '', '3000.00'], ['24/03/2020', '', '500.00', '2500.00']])

      expect { statement.display }.to output("date || credit || debit || balance\n24/03/2020 || || 500.00 || 2500.00\n23/03/2020 || 2000.00 || || 3000.00").to_stdout
    end
  end
end
