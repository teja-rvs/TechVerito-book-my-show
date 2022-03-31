require 'securerandom'

class User

    attr_accessor :name
    
    def initialize
        @name = SecureRandom.alphanumeric
    end

    def select_screen(movie)
        puts "Select screen for Movie #{movie.name}"

        movie.screens.each do |key, screen|
            puts key
        end

        movie.screens[gets.chomp]
    end

    def select_seats(screen)
        screen.seats.each do |key, seat|
            puts "#{seat.name} #{seat.category.price}" unless seat.booked
        end

        puts "Enter the number of seats"
        no_of_seats = gets.chomp.to_i

        selected_seats = []

        puts "Enter the seats"

        1.upto(no_of_seats).each do
            selected_seats << gets.chomp
        end
        selected_seats
    end
end