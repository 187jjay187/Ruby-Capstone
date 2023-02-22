require_relative 'items'

class Movie < Item
  attr_accessor :silent
  attr_reader :id

  def initialize(silent, publish_date)
    super(publish_date)
    @publish_date = publish_date
    @silent = silent
    items = []
  end

  def to_str
    puts "if_silent #{@silent}, publish_date #{@publish_date}"
  end

  private

  def can_be_archived?
    return true if super || @silent

    false
  end
end
