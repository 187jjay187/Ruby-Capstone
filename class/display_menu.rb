require_relative './book'
require_relative '../app'
require_relative 'movie'
require_relative '../exit_app'

# main entry point where the user can choise operations
def display_menu(app)
  puts "\nWelcome to our Catalog!"
  puts "\nPlease choose a task by entering a number:"
  puts " 1 - For listing items\n 2 - For adding items\n 3 - Exit App"
  choice = gets.chomp
  case choice
  when '1'
    listing(app)
  when '2'
    adding(app)
  when '3'
    exit_app(app)
  else
    puts 'Invalid selection'
  end
end

# list the different items
def listing(app)
  puts "\nWelcome to our Catalog!"
  puts "\nPlease select a number for listing items"
  puts " 1 - List all books\n 2 - List all music albums\n 3 - List all games\n 4 - For next menu\n 5 - Back to main\n 6 - Exit App" # rubocop:disable Layout/LineLength
  choice = gets.chomp
  case choice
  when '1'
    app.book_display
  when '2'
    app.music_display
  when '3'
    app.game_display
  when '4'
    display_next_menu(app)
  when '5'
    display_menu(app)
  when '6'
    exit_app(app)
  else
    puts 'Invalid selection'
  end
end

# rubocop:disable all

def display_next_menu(app)
  puts "\nWelcome to our Catalog!"
  puts "\nPlease select a number for listing items"
  puts " 1 - List all authors\n 2 - List all labels\n 3 - List all genres\n 4 - List all movies\n 5 - List all sources\n 6 - For previous menu\n 7 - Back to main\n 8 - Exit App" # rubocop:disable Layout/LineLength
  choice = gets.chomp
  case choice
  when '1'
    app.author_display
  when '2'
    app.label_display
  when '3'
    app.genre_display
  when '4'
    app.movie_display
  when '5'
    app.source_display
  when '6'
    listing(app)
  when '7'
    display_menu(app)
  when '8'
    exit_app(app)
  else
    puts 'Invalid selection'
  end
end

# A function to create different items
def adding(app)
  puts "\nWelcome to our Catalog!"
  puts "\nPlease select a number for adding items"
  puts " 1 - Add a book\n 2 - Add a music album\n 3 - Add a game\n 4 - Add a movie\n 5 - Add a label\n 6 - Back to main\n 7 - Exit App"
  choice = gets.chomp
  case choice
  when '1'
    app.book_create
  when '2'
    app.music_create
  when '3'
    app.game_create
  when '4'
    app.movie_create
  when '5'
    app.label_create
  when '6'
    display_menu(app)
  when '7'
    exit_app(app)
  end
end

# rubocop:enable all
