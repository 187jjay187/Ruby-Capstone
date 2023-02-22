require_relative '../Ruby-Capstone/class/book_methods'
require_relative '../Ruby-Capstone/class/display_menu'
require_relative '../Ruby-Capstone/class/add_music'
class App
  attr_accessor :book_list, :author_list, :music_album

  def initialize
    @book_list = []
    @author_list = []
    @music_album = CreatMusicAlbum.new
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

  def music_display
    @music_album.list_all_music
  end

  def music_create
    @music_album.creat_album
  end

  def genre_display
    @music_album.list_all_genre
  end

  def save_data
    @music_album.save
  end
end
