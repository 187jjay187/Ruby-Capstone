require_relative 'items'
require_relative 'movie'
require_relative 'source'

class CreateMovies
  def initialize
    @movies_list = []
    @sources = []
  end

  def add_movie
    puts 'When was the movie published [mm/dd/yyyy]'
    publish_date = gets.chomp
    puts "What is the movie source [e.g. 'From a friend', 'Online shop' ]"
    src = gets.chomp
    source = Source.new(src)
    @sources << source
    puts 'Is your movie silent? [y/n]:'
    silent = gets.chomp.downcase
    case silent
    when 'y'
      movie = Movie.new(true, publish_date)
    when 'n'
      movie = Movie.new(false, publish_date)
    end
    @movies_list << movie
    puts 'You have added a movie to your movies list.'
  end

  def list_all_movies
    puts 'No movies added yet' if @movies_list.empty?
    @movies_list.each_with_index do |movie, index|
      puts "#{index} - Movie ID:#{movie.id} Silent Movie:#{movie.silent}, Publish Date: #{movie.publish_date}"
    end
  end

  def list_all_sources
    puts 'No sources added yet' if @sources.empty?
    @sources.each_with_index do |source, index|
      puts "#{index} - Source ID:#{movie.id} Source: #{source.name} "
    end
  end
end


