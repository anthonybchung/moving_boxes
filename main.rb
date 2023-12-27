# frozen_string_literal: true

Box = Struct.new(:name, :order, :id)

box_one = Box.new(name: 'Propose', order: 1, id: 1)
box_two = Box.new(name: 'Planning', order: 2, id: 2)
box_three = Box.new(name: 'Doing', order: 3, id: 3)
box_four = Box.new(name: 'Completed', order: 4, id: 4)

boxes = []

boxes << box_one
boxes << box_two
boxes << box_three
boxes << box_four

p boxes
