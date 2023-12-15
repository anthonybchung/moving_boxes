puts "hello world"

Box = Struct.new(:name,:order,:id)

box_1 = Box.new(name: "Propose", order: 1, id: 1)
box_2 = Box.new(name: "Planning", order: 2, id: 2)
box_3 = Box.new(name: "Doing", order: 3, id: 3)
box_4 = Box.new(name: "Completed", order: 4, id: 4)

boxes = Array.new

boxes << box_1
boxes << box_2
boxes << box_3
boxes << box_4


