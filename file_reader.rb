require_relative './class/book_methods'


def read_book(file)
  puts ''
  puts '*********************       BOOKS      *********************'
  puts ''
  file.each do |el|
    book_id = el['value']['id']
    book_archived = el['value']['archived']
    book_publisher = el['value']['publisher']
    book_cover_state = el['value']['cover_state']
    book_publish_date = el['value']['publish_date']
    puts "ID: #{book_id} Book Publisher: #{book_publisher} Book Cover State: #{book_cover_state} Published on: #{book_publish_date} Archived: #{book_archived}" # rubocop:disable Layout/LineLength
    add_book(book_publisher, book_cover_state, book_publish_date)
  end
end

def read_author(file)
  puts ''
  puts '*********************      AUTHORS     *********************'
  puts ''
  file.each do |el|
    author_first = el['value']['first_name']
    author_last = el['value']['last_name']
    puts "Author First Name: #{author_first} Author Last Name: #{author_last}"
  end
end
