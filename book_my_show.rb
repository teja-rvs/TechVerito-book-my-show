
require_relative './models/category'
require_relative './models/seat'
require_relative './models/screen'
require_relative './models/user'
require_relative './models/bill'

require_relative './builders/movie_builder'
require_relative './builders/screen_builder'


silver_category = Category.new('Silver', 100)
gold_category = Category.new('Gold', 200)
diamond_category = Category.new('Diamaond', 300)

NO_OF_SCREENS = 3

screens = {}
1.upto(NO_OF_SCREENS).each do |i|
    screen_builder = ScreenBuilder.new
    screen_builder.name("Screen#{i}")
    screen_builder.build_seats(silver_category)
    screen_builder.build_seats(gold_category)
    screen_builder.build_seats(diamond_category)
    screens["Screen#{i}"] = screen_builder.screen
end

movie_builder = MovieBuilder.new
movie_builder.name("RRR")
movie_builder.screens(screens)

movie = movie_builder.movie

user = User.new
selected_screen = user.select_screen(movie)
selected_seats = user.select_seats(selected_screen)

bill = Bill.new(movie, selected_screen, selected_seats, user)
bill.generate
