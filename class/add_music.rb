require_relative 'items'
require_relative 'music'
require_relative 'genre'

class CreatMusicAlbum
  def initialize
    @music_albums = []
    @genres = []
  end

  def creat_album
    puts 'When did you publish your music album?[mm/dd/yyyy]'
    public_date = gets.chomp
    puts 'Can you tell me your music genre?[eg : pop,rock]'
    genre_type = gets.chomp
    genre = Genre.new(genre_type)
    @genres << genre
    puts 'Is your music album is on Spotify?[Y/N]:'
    on_spotify = gets.chomp.downcase
    case on_spotify
    when 'y'
      album = MusicAlbum.new(on_spotify, public_date)
    when 'n'
      album = MusicAlbum.new(false, public_date)
    end
    @music_albums << album
    puts 'You added your musci album to the list.'
  end

  def list_all_music
    puts 'It is empty' if @music_albums.empty?
    @music_albums.each_with_index do |album, index|
      puts "#{index},Music ID: It is on spotify: #{album.on_spotify} , Public Date: #{album.public_date}"
    end
  end

  def add_genre
    puts 'Can you tell me your music genre?[eg : pop,rock]'
    genre_type = gets.chomp
    genre = Genre.new(genre_type)
    @genres << genre
    puts 'You added the music genre'
  end

  def list_all_genre
    puts 'There is no genre' if @genres.empty?
    @genres.each_with_index { |genre, index| puts "#{index}, Genre ID: #{genre.id}, Your music genre: #{genre.name}" }
  end
end
