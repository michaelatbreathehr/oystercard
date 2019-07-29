require 'oystercard'

BALANCE_LIMIT = 90

describe Oystercard do

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
        subject.deduct(5)
        expect(subject.balance).to eq(5) 
    end

    describe "#touch_in" do
        it "raise error if if balance is below 1 when trying to touch in" do
            expect{subject.touch_in}.to raise_error "Balance needs to be 1 or more"
        end


        it "Change in_journey from false to true" do
            subject.topup(10)
            subject.touch_in
            expect(subject.in_journey?).to eq(true)
        end
    end

    describe "#touch_out" do
        it "Change in_journey from true to false" do
            subject.topup(10)
            subject.touch_in
            subject.touch_out
            expect(subject.in_journey?).to eq(false)
        end
    end


    # it "allows customer to touch out if in journey" do
    #     expect(subject.in_journey?).to eq false

    # end




end