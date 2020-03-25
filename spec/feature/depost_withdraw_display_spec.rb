require 'timecop'
require_relative '../../lib/account.rb'
require_relative '../../lib/statement.rb'
require_relative '../../lib/transaction.rb'

describe 'Bank account' do
  let(:account) { Account.new }
  let(:statement) {  Statement.new(account) }

  it 'will increase balance by 1000 if a deposit of 1000 is made' do 
    expect(account.deposit(1000)).to eq(1000)
  end

  it 'will decrease balance by 500 if a withdraw of 500 is made after a deposit of 700' do
    account.deposit(700)
    expect(account.withdraw(500)).to eq(200)
  end

  it 'raises an error if deposit is not a valid number' do
    expect { account.deposit('wf') }.to raise_error('Please enter a valid amount')
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