class Oystercard

    attr_reader :balance
    attr_reader :entry_station
    attr_accessor :journey_history


    BALANCE_LIMIT = 90
    BALANCE_MINIMUM = 1
    MINIMUM_CHARGE = 1
    
    def initialize(balance=0)
        @balance = balance
        @in_journey = false
        @entry_station = nil
        @journey_history = []
    end

    def topup(value)
        raise "Balance can not be more than #{BALANCE_LIMIT}" if (@balance + value) > BALANCE_LIMIT
        @balance += value
    end

    def touch_in(station)
        raise "Already in journey" if in_journey?
        raise "Balance needs to be 1 or more" if @balance < BALANCE_MINIMUM
        @in_journey = true
        @entry_station = station
    end

    def touch_out(station)
        raise "Already out of journey" if !in_journey?
        @in_journey = false
        deduct(MINIMUM_CHARGE)
        @entry_station = nil
    end

    def in_journey?
        @in_journey
        !!entry_station
    end

    def journey_history
    end
      
    private
    def deduct(value)
        @balance -= value
    end

    
end