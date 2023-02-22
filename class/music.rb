require_relative 'items'

class MusicAlbum < Item
  attr_accessor :on_spotify, :public_date
  attr_reader :id

  def initialize(on_spotify, public_date)
    super(public_date)
    @public_date = public_date
    @on_spotify = on_spotify
    @items = []
  end

  def create_json
   {
    on_spotify: @on_spotify,
    public_date: @public_date
   }
  end

  private

  def can_be_archived?
    return true if super && @on_spotify
  end
end
