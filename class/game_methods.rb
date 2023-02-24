require_relative 'game'
require_relative 'author'
require_relative 'items'
# require_relative 'data_store'

class Game
  attr_accessor :games, :authors

  def initialize
    # @data_store = DataStore.new
    @games = []
    @authors = []
  end

  def list_games
    if @games.empty?
      puts 'No game available!'
    else
      @games.each_with_index do |game, index|
        author_names = game.authors.map { |author_id| find_author_by_id(author_id).full_name }.join(", ")
        puts "#{index + 1} Multiplayer: #{game.multiplayer}, Last played at: #{game.last_played_at}, Authors: #{author_names}"
      end
    end
  end

  def list_authors
    if @authors.empty?
      puts 'No author available!'
    else
      authors.each_with_index { |author, index| puts "#{index + 1}: #{author.full_name}" }
    end
  end

  def add_game
    game_user_input
    author_user_input
    authors = @first_name && @last_name ? [find_or_create_author(@first_name, @last_name).id] : []
    game = Game.new(@multiplayer, @last_played_at, authors, @publish_date)
    authors.each { |author_id| find_author_by_id(author_id).add_item(game) }
    @games << game unless @games.include?(game)
    @data_store.save_games(@games)
    @data_store.save_authors(@authors)
    puts 'Game successfully created'
  end

  private

  def game_user_input
    puts 'Please fill the following information:'
    puts ''
    print 'Enter a name (Multiplayer): '
    @multiplayer = $stdin.gets.chomp
    while @multiplayer.empty? || @multiplayer.length < 2
      print 'No name entered, enter a valid name: '
      @multiplayer = $stdin.gets.chomp
    end
    print 'When last did you play (Year)?("YYYY"): '
    @last_played_at = $stdin.gets.chomp
    while @last_played_at.empty? || @last_played_at.length != 4
      print 'No year entered, enter a valid year("YYYY"): '
      @last_played_at = $stdin.gets.chomp
    end
  end

  def author_user_input
    print 'Enter your first name: '
    @first_name = $stdin.gets.chomp
    while @first_name.empty? || @first_name.length < 2
      print 'No name entered, enter a valid name: '
      @first_name = $stdin.gets.chomp
    end
    print 'Enter your last name: '
    @last_name = $stdin.gets.chomp
    while @last_name.empty? || @last_name.length < 2
      print 'No name entered, enter a valid name: '
      @last_name = $stdin.gets.chomp
    end
  end
end
