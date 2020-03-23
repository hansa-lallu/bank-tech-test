require 'statement'
require 'timecop'

describe Statement do
  it 'prints a header' do
    expect(subject.header).to eq("date || credit || debit || balance")
  end

  it 'gives current date' do 
    Timecop.freeze do
      date = Time.now.strftime("%d/%m/%Y")
      expect(subject.date).to eq(Time.now.strftime("%d/%m/%Y"))
    end
  end 
end
