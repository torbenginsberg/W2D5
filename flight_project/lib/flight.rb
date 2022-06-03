require_relative "passenger.rb"

class Flight
    attr_reader :passengers
    
    def initialize(flight_number, capacity)
       @flight_number = flight_number
       @capacity = capacity
       @passengers = []
    end

    def full?
        @passengers.length == @capacity
    end

    def board_passenger(passenger)
        @passengers << passenger if passenger.has_flight?(@flight_number) && !self.full?
    end

    def list_passengers
        passenger_names = []
        @passengers.each do |instance|
            passenger_names << instance.name
        end
        passenger_names
    end

    def [](index)
        @passengers[index]
    end

    def <<(passenger)
        board_passenger(passenger)
    end
end