# model.rb
# frozen_string_literal: false

Ordered_box = Struct.new(:box, :position)

# class Boxes is responsible in putting the boxes in order.
class Boxes
  attr_accessor :line

  def initialize
    @line = []
  end

  def add(new_box)
    ordered_box = Ordered_box.new(new_box, @line.length + 1)
    @line << ordered_box
  end

  def delete(position)
    @line.reject! { |element| element.position == position }
    @line.each do |element|
      element.position -= 1 if element.position > position
    end
  end

  def move_up(initial_position, final_position)
    chosen_box_index = nil
    @line.each_with_index do |element, index|
      chosen_box_index = index if element.position == initial_position
      element.position += 1 if element.position < initial_position && element.position >= final_position
    end
    @line[chosen_box_index].position = final_position
  end
end
