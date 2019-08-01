class Journey

attr_accessor :journey_history, :current_journey

    def initialize
        @journey_history = []
        @current_journey = {
            :entry_station => nil,
            :exit_station => nil
            }
    end

    def entry_station(name)
        @current_journey.entry_station << name
    end

    def exit_station

    end



end