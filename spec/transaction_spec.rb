require 'transaction'

describe Transaction do

  describe '#initialize' do 
    it 'has an empty transaction log on initalization' do 
    expect(subject.transaction_log).to eq([])
    end 
  end
end