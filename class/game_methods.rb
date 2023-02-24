require_relative 'game'
require_relative 'author'
require_relative 'items'
# require_relative 'data_store'

def list_games
  if @games.empty?
    puts 'No game available!'
  else
    @games.each_with_index do |game, index|
      author_names = @games.map { puts "#{index + 1} Multiplayer: #{game.multiplayer}, Last played at: #{game.last_played_at}, Authors: #{author_names}" } # rubocop:disable Layout/LineLength
    end
  end
end

def list_authors
  if @author_list.empty?
    puts 'No author available!'
  else
    author_list.each_with_index { |author, index| puts "#{index + 1}: #{author.full_name}" }
  end
end

def add_game(multiplayer, last_played_at, publish_date)
  new_game = Game.new(multiplayer, last_played_at, publish_date)
  @games << new_game
end

def create_game
  input = author_user_input
  author = Author.new(input[0], input[1])
  @author_list << author
  game_input = game_user_input
  puts 'When did you publish your game?:'
  publish_date = gets.chomp
  game = Game.new(game_input[0], game_input[1], publish_date)
  games << game
  puts 'you added the game successfully!'
end

  private

def game_user_input
  puts 'Please fill the following information:'
  puts ''
  print 'Enter a name (Multiplayer): '
  multiplayer = $stdin.gets.chomp
  while multiplayer.empty? || multiplayer.length < 2
    print 'No name entered, enter a valid name: '
    multiplayer = $stdin.gets.chomp
  end
  print 'When last did you play (Year)?("YYYY"): '
  last_played_at = $stdin.gets.chomp
  while last_played_at.empty? || last_played_at.length != 4
    print 'No year entered, enter a valid year("YYYY"): '
    last_played_at = $stdin.gets.chomp
  end
  [multiplayer, last_played_at]
end

def author_user_input
  print 'Enter your first name: '
  first_name = $stdin.gets.chomp
  while first_name.empty? || first_name.length < 2
    print 'No name entered, enter a valid name: '
    first_name = $stdin.gets.chomp
  end
  print 'Enter your last name: '
  last_name = $stdin.gets.chomp
  while last_name.empty? || last_name.length < 2
    print 'No name entered, enter a valid name: '
    last_name = $stdin.gets.chomp
  end
  [first_name, last_name]
end
