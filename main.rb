require_relative 'items'

item = Item.new('21-6-2016')

p item.can_be_archived?

p item.move_to_archive

