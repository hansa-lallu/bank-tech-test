require 'account'

describe Account do
  describe '#initialize' do
    it 'has a default balance of zero' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'can increase balance by 10' do
      expect(subject.deposit(10)).to eq(10)
    end

    it 'can calculate multiple deposits' do
      subject.deposit(500)
      expect(subject.deposit(50)).to eq(550)
    end

    it 'raises an error if amount is not a valid number' do
      expect { subject.deposit('wf') }.to raise_error('Please enter a valid amount')
    end
  end

  describe '#withdraw' do
    it 'decreases the balance from 100 to 20' do
      subject.deposit(100)
      expect(subject.withdraw(20)).to eq(80)
    end

    it 'can calculate multiple withdraws' do
      subject.deposit(500)
      subject.withdraw(100)
      expect(subject.withdraw(100)).to eq(300)
    end

    it 'raises an error if ammount is not a valid number' do
      expect { subject.withdraw('wf') }.to raise_error('Please enter a valid amount')
    end

    it 'raises an error if balance goes below zero' do
      expect { subject.withdraw(10) }.to raise_error('You do not have enough money to withdraw')
    end
  end
end
