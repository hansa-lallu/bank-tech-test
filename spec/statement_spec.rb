require 'statement'
require 'timecop'

describe Statement do
  it 'prints a header' do
    expect(subject.header).to eq("date || credit || debit || balance")
  end
end
