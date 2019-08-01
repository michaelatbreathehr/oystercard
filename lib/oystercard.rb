class Oystercard

    attr_reader :balance, :journey
    attr_accessor :journey_history, :current_journey

    BALANCE_LIMIT = 90
    BALANCE_MINIMUM = 1
    MINIMUM_CHARGE = 1
    
    def initialize(balance=0)
        @journey = Journey.new
        @balance = balance
        @in_journey = false
    end

    def topup(value)
        raise "Balance can not be more than #{BALANCE_LIMIT}" if (@balance + value) > BALANCE_LIMIT
        @balance += value
    end

    def touch_in(entry_station)
        raise "Already in journey" if in_journey?
        raise "Balance needs to be 1 or more" if @balance < BALANCE_MINIMUM
        @in_journey = true
        entry_station(entry_station)
    end

    def touch_out(exit_station)
        raise "Already out of journey" unless in_journey?
        @in_journey = false
        exit_station(exit_station)
        deduct(MINIMUM_CHARGE)
        complete_journey
    end

    def in_journey?
        !@journey.current_journey[:entry_station].nil?
    end
      
    private
    def deduct(value)
        @balance -= value
    end

    def complete_journey
        @journey.journey_history << @journey.current_journey
        @journey.current_journey = {
            :entry_station => nil,
            :exit_station => nil
        }
    end
    
    def entry_station(station)
        @journey.current_journey[:entry_station] = station
    end

    def exit_station(station)
        @journey.current_journey[:exit_station] = station
    end

end