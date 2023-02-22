require_relative 'items'
require_relative 'genre'

class AddGenre
 def initialize
  @genres = []
 end

 def add_genre 
  puts "Can you tell me your music genre?[eg : pop,rock]"
  genre_type = gets.chomp.uppcase
  genre = Genre.new(genre_type)
 @genres << genre
 puts "You added the music genre"
 end

 def list_all_genre
  puts "There is no genre" if @genres.empty?
  @genres.each_with_index { |genre,index| puts "#{index}, Your music genre: #{genre.name}"}
 end

end