require './class/add_movie'

class App
  def initialize
    @books = []
    @music_album = []
    @games = []
    @movies = CreateMovies.new
  end

   # rubocop:disable all
  def chose_option
    answer = gets.chomp
    case answer
    when '0'
      exit 0
    when '1'
      puts 'List all books'
    when '2'
      puts 'List all music album'
    when '3'
      @movies.list_all_movies
    when '4'
      puts 'List of games'
    when '5'
      puts 'List all genre'
    when '6'
      puts 'List all lables'
    when '7'
      puts 'List all authors'
    when '8'
      @movies.list_all_sources
    when '9'
      puts 'Add a book'
    when '10'
      puts 'Add a music album'
    when '11'
      @movies.add_movie
    when '12'
      puts 'Add a game'
    else
      puts 'Invlaid input'
    end
  end
  # rubocop:enable all

  def display_option
    puts 'Welcome to the app'
    puts "The following options should be available:
   0. Exit
   1.List all books
   2.List all music albums
   3.List all movies
   4.List of games
   5.List all genres (e.g 'Comedy', 'Thriller')
   6.List all labels (e.g. 'Gift', 'New')
   7.List all authors (e.g. 'Stephen King')
   8.List all sources (e.g. 'From a friend', 'Online shop')
   9.Add a book
   10.Add a music album
   11.Add a movie
   12.Add a game"
  end

  def run
    display_option
    loop do
      chose_option
    end
  end
end
