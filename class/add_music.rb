require_relative 'items'
require_relative 'music'

class CreatMusicAlbum
 def initialize
  @music_albums = []
 end

 def creat_album
  puts "When did you publish your music album?"
  public_date = gets.chomp
  puts "Is your music album is on Spotify?[Y/N]:"
  on_spotify = gets.chomp.downcase
  case on_spotify
  when 'y'
   album = MusicAlbum.new(on_spotify,public_date)
  when 'n'
   album = MusicAlbum.new(on_spotify,public_date)
  end
  @music_albums << album
  puts "You added your musci album to the list."
 end

 def list_all_music
  puts "It is empty" if @music_albums.empty?
  @music_albums.each_with_index { |album,index| puts "#{index}, It is on spotify: #{album} "}
 end

end