
class Model

  attr_accessor :boxes

  def initialize(boxes)
    @boxes = boxes
  end

  def find(box)
    found_index = nil 
    @boxes.each_with_index do |current_box, index|
     found_index = index if box.id == current_box.id 
    end
    found_index
  end

  def swap(box_1,box_2)
    order_1 = box_1.order
    order_2 = box_2.order
  end


end
