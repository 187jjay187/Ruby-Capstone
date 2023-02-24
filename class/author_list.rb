require_relative 'author'

def create_author
  puts 'Please enter the first_name: '
  first_name = gets.chomp.capitalize
  puts 'Please enter the last_name:'
  last_name = gets.chomp
  author = Author.new(first_name, last_name)
  @author_list << author
end

def list_authors
  if @author_list.empty?
    puts 'Author list is empty'
  else
    @author_list.each_with_index do |author, index|
      puts "(#{index}) ID: #{author.id} First_name: \"#{author.first_name}\",  Last_name: \"#{author.last_name}\""
    end
  end
end
