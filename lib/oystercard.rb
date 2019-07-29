class Oystercard

    attr_reader :balance

    BALANCE_LIMIT = 90

    def initialize(balance=0)
        @balance = balance
        @in_journey = false
    end

    def topup(value)
        raise "Balance can not be more than #{BALANCE_LIMIT}" if (@balance + value) > BALANCE_LIMIT
        @balance += value
    end

    def deduct(value)
        @balance -= value
    end

    def touch_in
        raise "Already in journey" if in_journey?
        raise "Balance needs to be 1 or more" if @balance < 1
        @in_journey = true
    end

    def touch_out
        raise "Already out of journey" if !in_journey?
        @in_journey = false
    end

    # def touch
    #     @in_journey = !@in_journey
    #     # use the above instead of having the if/else statement below
    #     # if @in_journey == true
    #     #     @in_journey = false
    #     # else 
    #     #     @in_journey = true
    #     # end
    # end

    def in_journey?
        @in_journey
    end

end