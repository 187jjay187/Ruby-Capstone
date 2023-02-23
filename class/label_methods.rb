require_relative 'label'

def create_label
  puts 'Please enter the title: '
  title = gets.chomp.capitalize
  puts 'Please enter the color:'
  color = gets.chomp
  lable = Label.new(title, color)
  @label << lable
end

def list_label
  if @label.empty?
    puts 'Author list is empty'
  else
    @label.each_with_index do |label, index|
      puts "(#{index}) ID: #{label.id} Title: \"#{label.title}\",  Color: \"#{label.color}\""
    end
  end
end
