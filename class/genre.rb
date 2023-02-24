class Genre
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items << item
  end

  def create_json
    {
      name: @name
    }
  end
end
