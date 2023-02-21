require 'date'
class Item
  attr_reader :archive, :publish_date

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
end