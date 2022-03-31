class Bill

    attr_accessor :movie, :screen, :seats, :total_amount, :user

    def initialize(movie, screen, seats, user)
        @movie = movie
        @screen = screen
        @seats = seats
        @total_amount = 0
        @user = user
    end

    def generate
        @seats.each do |selected_seat|
            seat = @screen.seats[selected_seat]
            seat.booked = true
            puts "#{seat.name}: #{seat.category.price}"
            @total_amount += seat.category.price
        end
        
        puts "Total Amount: #{total_amount}"
    end

end