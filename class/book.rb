require_relative 'items'

class Book < Item
  attr_accessor :publisher, :publish_date, :archived
  attr_reader :cover_state, :id

  def initialize(publisher, cover_state, publish_date)
    super(id = Random.rand(1..1000))
    @id = id
    @publisher = publisher
    @cover_state = cover_state
    @publish_date = publish_date
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    @archived = if super || @cover_state == 'bad'
                  true
                else
                  false
                end
  end
end
