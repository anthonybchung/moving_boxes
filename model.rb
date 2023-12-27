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

  def swap(box_1, box_2)
    order_1 = box_1.order
    order_2 = box_2.order

    index_1 = find(box_1)
    index_2 = find(box_2)

    box_1.order = order_2
    box_2.order = order_1

    @boxes[index_1] = box_2
    @boxes[index_2] = box_1
  end

  def find_by_name(name)
    found_box = nil
    @boxes.each do |current_box|
      found_box = current_box if current_box.name == name
    end
    found_box
  end

  def move_up(order); end
end
