require_relative '../models/screen'


class ScreenBuilder
    attr_accessor :screen

    def initialize
        @screen = Screen.new
        @screen.seats = {}
    end

    def name(name)
        @name = name
    end

    def build_seats(category)
        seat_name = category.name[0]
        1.upto(10).each do |i|
            @screen.seats["#{seat_name}#{i}"] = Seat.new(category, "#{seat_name}#{i}")
        end
    end
end