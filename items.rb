class Item
 def initialize(publish_date)
  @id = Random.rand(1..1000)
  @publish_date = publish_date
  @archive = false
 end

 def can_be_archived?  
 return true if Date.parse(@publish_date - Date.today).to_f > 10
 end

 def move_to_archive
  @archive = true if can_be_archived?
 end

end