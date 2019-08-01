require 'oystercard'

BALANCE_LIMIT = 90
BALANCE_MINIMUM = 1
MINUMUM_CHARGE = 1

describe Oystercard do
    let(:entry_station) {:station}
    let(:exit_station) {:station}

    it "has an empty journey history" do 
        expect(subject.journey.journey_history).to be_empty
    end

    it "has a history" do
        subject.topup(10)
        subject.touch_in("station1")
        subject.touch_out("station2")
        expect(subject.journey.journey_history).not_to be_empty
    end

    it "card has a balance of 0" do
        expect(subject.balance).to eq 0
    end


    it "Has new balance after top up" do
        subject.topup(5)
        expect(subject.balance).to eq(5)
    end

    it "Raise error when balance over 90" do
        expect{subject.topup(91)}.to raise_error "Balance can not be more than #{BALANCE_LIMIT}"
    end

    it "Has a new balance after deductions applied to card" do
        subject.topup(10)
        subject.touch_in(entry_station)
        subject.touch_out(exit_station)
        expect(subject.balance).to eq(9) 
    end

    describe "#touch_in" do
        it "raise error if if balance is below 1 when trying to touch in" do
            expect{subject.touch_in(entry_station)}.to raise_error "Balance needs to be 1 or more"
        end


        it "Change in_journey from false to true" do
            subject.topup(10)
            subject.touch_in(entry_station)
            expect(subject.in_journey?).to eq(true)
        end
    end

    
        it 'stores the entry station' do
            subject.topup(10)
            subject.touch_in(entry_station)
            expect(subject.journey.current_journey[:entry_station]).to eq entry_station
        end

    describe "#touch_out" do
        it "Change in_journey from true to false" do
            subject.topup(10)
            subject.touch_in(entry_station)
            expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by(-Oystercard::MINIMUM_CHARGE)
        end

        it "rasies an error if already touched out" do

            subject.topup(10)
            subject.touch_in(entry_station)
            subject.touch_out(exit_station)
            expect{subject.touch_out(entry_station)}.to raise_error "Already out of journey"
        end

    end

    it "allows customer to touch out if in journey" do
        expect(subject.in_journey?).to eq false

    end





end