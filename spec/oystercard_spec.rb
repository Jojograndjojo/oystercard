require 'oystercard'

describe Oystercard do

 	  it 'has an initial balance of 0' do
    expect(subject.balance).to eq(0)
  	end


  describe '#top_up' do

    	it { is_expected.to respond_to(:top_up).with(1).argument }

    	it 'can top up the balance' do
      expect{subject.top_up 1}.to change{subject.balance}.by 1
    	end


    	it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.top_up 1 }.to raise_error 'Maximum balance of #{maximum_balance} exceeded'
    	end

  end

  # describe '#deduct' do

  #   	it { is_expected.to respond_to(:deduct).with(1).argument }

  #   	it 'deducts a fare to pay for journey' do
  #   	expect{subject.deduct 1 }.to change{subject.balance}.by -1
  #   	end
  # end

  describe '#in_journey?' do
      it {is_expected.to respond_to(:in_journey?)}

      it 'initializes journey with false' do
        expect(subject.in_journey?).to be(false)
      end

      it 'responds to touch_in with true' do
        subject.top_up Oystercard::MINIMUM_BALANCE
        subject.touch_in
        expect(subject.in_journey?).to be true
      end

      it 'responds to touch_out with false' do
      subject.touch_out
      expect(subject.in_journey?).to be false
      end

  end

  describe '#touch_in' do

    it 'refuses a card with a balance less than minimum balance' do
      expect{subject.touch_in}.to raise_error ("Insufficient funds!")
    end

  end

  describe '#touch_out' do
    it 'charges your card' do
      expect{subject.touch_out}.to change{subject.balance}.by (-Oystercard::FARE)
    end
  end


end