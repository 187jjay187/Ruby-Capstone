require_relative 'items'
require_relative 'music'
require_relative 'genre'
require_relative 'data_store'
require 'json'

class CreatMusicAlbum
  def initialize
    @music_albums = []
    @genres = []
    @album_store = DataStore.new('music_album')
    @music_albums = @album_store.read_file.map { |album| MusicAlbum.new(album['on_spotify'], album['public_date']) }
    @genre_store = DataStore.new('genre')
    @genres = @genre_store.read_file.map { |genre| Genre.new(genre['name']) }
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
      puts "#{index},Music ID: #{album.id} It is on spotify: #{album.on_spotify} , Public Date: #{album.public_date}"
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

  # save the data method

  def save
    music_album = @music_albums.map(&:create_json)
    write_data = JSON.pretty_generate(music_album)
    File.write('music_album.json', write_data)
    genre = @genres.map(&:create_json)
    genre_data = JSON.pretty_generate(genre)
    File.write('genre.json', genre_data)
  end
end
