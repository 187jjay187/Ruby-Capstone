require 'date'

class Item
  attr_accessor :archive, :publish_date
  attr_reader :label, :author, :genre, :source

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archive = false
  end

  def can_be_archived?
    (DateTime.now.year - DateTime.parse(@publish_date).year).to_f > 10
  end

  def move_to_archive
    @archive = can_be_archived?
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def source=(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end
end
