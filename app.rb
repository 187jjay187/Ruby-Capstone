require './class/add_movie'
require './class/add_music'
require_relative '../Ruby-Capstone/class/book_methods'
require_relative '../Ruby-Capstone/class/display_menu'

class App
  attr_accessor :book_list, :author_list

  def initialize
    @book_list = []
    @author_list = []
    @music_album = []
    @games = []
    @movies = CreateMovies.new
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
end
