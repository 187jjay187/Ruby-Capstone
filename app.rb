require_relative '../Ruby-Capstone/class/add_movie'
require_relative '../Ruby-Capstone/class/book_methods'
require_relative '../Ruby-Capstone/class/display_menu'
require_relative '../Ruby-Capstone/class/music_methods'
require_relative '../Ruby-Capstone/class/game_methods'
require_relative '../Ruby-Capstone/file_reader'
require 'json'

class App
  attr_accessor :book_list, :author_list, :music_album, :movies, :games, :genres

  def initialize
    @book_list = []
    @author_list = []
    @music_album = []
    @games = GamePlay.new
    @movies = []
    @genres = []
  end

  def book_display
    list_books
  end

  def author_display
    @authors.list_authors
  end

  def game_display
    @games.list_games
  end

  def game_create
    @games.add_game
  end

  def book_create
    create_book
  end

  def movie_create
    @movies.add_movie
  end

  def movie_display
    @movies.list_all_movies
  end

  def source_display
    @movies.list_all_sources
  end

  def music_display
    list_all_music
  end

  def music_create
    create_album
  end

  def genre_display
    list_all_genre
  end

  def save_files
    instance_variables.each do |var|
      file_name = var.to_s.chomp('_list').delete('@')
      ary = []
      instance_variable_get(var).each do |obj|
        hash = { ref: obj, value: to_hash(obj) }
        ary << hash
      end
      File.write("./data/#{file_name}.json", JSON.generate(ary))
    end
  end

  # rubocop:disable all
  def read_files
    instance_variables.each do |var|
      file_name = var.to_s.chomp('_list').delete('@')
      if File.exist?("./data/#{file_name}.json") && File.read("./data/#{file_name}.json") != ''
        ary = JSON.parse(File.read("./data/#{file_name}.json"))
        case file_name
        when 'book'
          read_book(ary)
        when 'music_album'
          read_music(ary)
        # when 'games'
        #   read_games(ary)
        when 'movie'
          read_movies(ary)
        end
      else
        File.write("./data/#{file_name}.json", '[]')
      end
    end
  end

  def read_files2
    instance_variables.each do |var|
      file_name = var.to_s.chomp('_list').delete('@')
      if File.exist?("./data/#{file_name}.json") && File.read("./data/#{file_name}.json") != ''
        ary = JSON.parse(File.read("./data/#{file_name}.json"))
        case file_name
        when 'authors'
          read_author(ary)
        when 'label'
          read_label(ary)
        when 'genres'
          read_genre(ary)
        end
      else
        File.write("./data/#{file_name}.json", '[]')
      end
    end
  end
  def to_hash(obj)
  hash = {}
  obj.instance_variables.each do |var|
  hash[var.to_s.delete('@')] = obj.instance_variable_get(var)
  end
  hash
  end
  end
  # rubocop:disable all