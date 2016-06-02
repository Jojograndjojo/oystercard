describe Station do

  subject(:station) {described_class.new("Monument",1)}

  describe '#zone' do
    it "allows to set the station's zone" do
      expect{(station.zone).to respond_to(:even)}
    end
  end

  describe '#name' do
    it "allows to set the station's name" do
      expect{(station.name).to respond_to(:upcase)}
    end
  end

end
