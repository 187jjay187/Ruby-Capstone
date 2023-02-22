require_relative '../Ruby-Capstone/class/add_movie'
require_relative '../Ruby-Capstone/class/book_methods'
require_relative '../Ruby-Capstone/class/display_menu'
require_relative '../Ruby-Capstone/class/add_music'
require_relative '../Ruby-Capstone/file_reader'

class App
  attr_accessor :book_list, :author_list, :music_album, :movies

  def initialize
    @book_list = []
    @author_list = []
    @music_album = []
    @games = []
    @movies = []
  end

  def book_display
    list_books
  end

  def author_display
    list_authors
  end

  def book_create
    create_book
  end

  def movie_create
    @movie.add_movie
  end

  def movie_display
    @movie.list_all_movies
  end

  def source_display
    @movie.list_all_sources
  end

  def music_display
    @music_album.list_all_music
  end

  def music_create
    @music_album.creat_album
  end

  def genre_display
    @music_album.list_all_genre
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
        when 'music'
          read_music(ary)
        when 'game'
          read_game(ary)
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
        when 'author'
          read_author(ary)
        when 'label'
          read_label(ary)
        when 'genre'
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
