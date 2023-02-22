
require_relative '../Ruby-Capstone/class/book_methods'
require_relative '../Ruby-Capstone/class/display_menu'
require './class/add_music'

class App
  attr_accessor :book_list, :author_list

  def initialize
    @book_list = []
    @author_list = []
    @music_album = []
    @games = []
    @movies = []
  end


  def author_display
    list_authors
  end

  def book_create
    create_book
  end
end
