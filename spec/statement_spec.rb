require 'statement'
require 'timecop'

describe Statement do

  let(:transactions) { double :transactions }

  it 'prints a header' do
    expect(subject.header).to eq('date || credit || debit || balance')
  end

  describe '#print' do
    it 'prints a statement of transaction logs' do
      Timecop.freeze do
        date = Time.now.strftime("%d/%m/%Y")
        allow(transactions).to receive(:log).and_return([[date, '', "500.00", "2500.00"], [date, "2000.00", '', "3000.00"]])
        statement = Statement.new(transactions)
        
        expect { statement.print }.to output("date || credit || debit || balance\n#{date} || || 500.00 || 2500.00\n#{date} || 2000.00 || || 3000.00").to_stdout
      end
    end

    it 'prints a statement from most recent transactions first' do
        allow(transactions).to receive(:log).and_return([["23/03/20", '', "500.00", "2500.00"], ["24/03/20", "2000.00", '', "3000.00"]])
        statement = Statement.new(transactions)
        
        expect { statement.print }.to output("date || credit || debit || balance\n24/03/20 || || 500.00 || 2500.00\n23/03/20 || 2000.00 || || 3000.00").to_stdout
    end
  end
end



 