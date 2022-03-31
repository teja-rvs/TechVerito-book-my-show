require_relative '../models/movie'

class MovieBuilder
    attr_accessor :movie

    def initialize
        @movie = Movie.new
    end

    def name(name)
        @movie.name = name
    end

    def screens(screens)
        @movie.screens = screens
    end
end