require 'test/unit'

require_relative '../models/category'
require_relative '../models/seat'
require_relative '../models/screen'
require_relative '../models/user'
require_relative '../models/bill'

require_relative '../builders/movie_builder'
require_relative '../builders/screen_builder'

class BillTest < Test::Unit::TestCase

    def setup
        silver_category = Category.new('Silver', 100)
        gold_category = Category.new('Gold', 200)
        diamond_category = Category.new('Diamaond', 300)
        screens = {}
        screen_builder = ScreenBuilder.new
        screen_builder.name("Screen1")
        screen_builder.build_seats(silver_category)
        screen_builder.build_seats(gold_category)
        screen_builder.build_seats(diamond_category)
        screens["Screen1"] = screen_builder.screen
        movie_builder = MovieBuilder.new
        movie_builder.name("RRR")
        movie_builder.screens(screens)
        @movie = movie_builder.movie
        @user = User.new
    end

    def test_total_amount
        selected_seats = ["S1", "G1", "D1"]
        selected_screen = "Screen1"
        bill = Bill.new(@movie, @movie.screens[selected_screen], selected_seats, @user)
        bill.generate
        assert_equal(bill.total_amount, 600)
    end

    def test_seats_booked
        selected_seats = ["S1", "G1", "D1"]
        selected_screen = "Screen1"
        bill = Bill.new(@movie, @movie.screens[selected_screen], selected_seats, @user)
        bill.generate
        selected_seats.each do |seat|
            assert_equal(@movie.screens[selected_screen].seats[seat].booked, true)
        end
    end
end