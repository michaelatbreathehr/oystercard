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


end