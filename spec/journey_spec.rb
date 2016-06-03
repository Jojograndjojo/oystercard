# responsible for starting a journey, finishing a journey, calculating the fare of a journey, and returning whether or not the journey is complete.
require 'journey'
describe Journey do
subject(:journey){described_class.new}
let(:station){double(:station)}

  describe '#start' do

    it 'should record the entry station' do
    expect{journey.start(station)}.to change{journey.journey_log.length}.by(1)
    end
  end

  describe '#finish' do

    it 'should record the exit station' do
    expect{journey.finish(station)}.to change{journey.journey_log.length}.by(1)
    end
  end

  describe '#fare' do

    it 'should return the journey fare' do
    expect{(journey.fare).to respond_to(:even)}
    end
  end

  describe '#complete' do

    it 'should return true if the journey is complete' do
    journey.start(station)
    journey.finish(station)
    expect(journey.complete).to be true
    end

    it 'should return false if the journey is not complete' do
    journey.start(station)
    journey.finish(station)
    journey.finish(station)
    expect(journey.complete).to be false
    end

  end



end