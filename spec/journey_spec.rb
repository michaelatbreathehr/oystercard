require 'journey'

describe Journey do
    let(:entry_station) {double('station name')}
    # let(:exit_station) {double(:exit => nil)}

    it "Has an entry station when started" do
        expect{subject.entry_station(name)}.to eq ('station name')
    end

    it "Has an exit station when complete" do
        expect(subject.exit_station).to eq (nil)
    end

    it "produces a fare when journey is complete" do
    end

    it "produces a penalty fare if journey is incomplete" do
    end

end
