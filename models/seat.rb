class Seat
    attr_accessor :category, :booked, :name

    def initialize(category, name)
        @category = category
        @booked = false 
        @name = name
    end
end