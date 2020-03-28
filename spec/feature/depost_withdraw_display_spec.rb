require 'timecop'
require_relative '../../lib/account.rb'
require_relative '../../lib/statement.rb'
require_relative '../../lib/transaction.rb'

describe 'Bank account' do
  let(:account) { Account.new }
  let(:statement) {  Statement.new(account) }

  it 'raises an error if deposit is not a valid number' do
    expect { account.deposit('wf') }.to raise_error('Please enter a valid amount')
  end

  it 'gives an empty bank statement when there has been no transactions' do 
      expect { statement.display }.to output("date || credit || debit || balance\n").to_stdout
  end 

  it "shows relevant transactions on the statement" do
    Timecop.freeze do
      account.deposit(1000)
      account.withdraw(500)
      expect { statement.display }.to output("date || credit || debit || balance\n"\
        "#{Time.now.strftime('%d/%m/%Y')} || 1000.00 || || 1000.00\n"\
        "#{Time.now.strftime('%d/%m/%Y')} || || 500.00 || 500.00").to_stdout
    end
  end
end