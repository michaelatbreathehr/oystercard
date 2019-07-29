class Oystercard

    attr_reader :balance

    BALANCE_LIMIT = 90

    def initialize(balance=0)
        @balance = balance
    end

    def topup(value)
        raise "Balance can not be more than #{BALANCE_LIMIT}" if (@balance + value) > BALANCE_LIMIT
        @balance += value
    end

end