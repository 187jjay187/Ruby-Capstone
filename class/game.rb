require_relative 'items'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :authors

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @publish_date = publish_date
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @authors = authors
  end

  private

  def can_be_archived?
    super && authors.none? { |author| author.has_item?(self) }
  end
end
