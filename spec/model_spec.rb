# model_spec.rb
# frozen_string_literal: true

require_relative '../model'

Box = Struct.new(:id, :name, :description)

RSpec.describe Boxes do
  it 'should initialise with an empty array called line' do
    boxes = Boxes.new
    expect(boxes).to have_attributes(line: an_instance_of(Array))
  end

  it 'should add a box into the line' do
    boxes = Boxes.new
    box = Box.new(1, 'Anthony', 'this is Anthony\'s box')
    boxes.add(box)
    expect(boxes.line.length).to eq(1)
  end

  it 'should assign a max position to the box when a box is added to Boxes' do
    boxes = Boxes.new
    box = Box.new(1, 'Anthony', 'this is Anthony\'s box')
    boxes.add(box)
    box_two = Box.new(2, 'Bernard', 'this is Middle\'s box')
    boxes.add(box_two)
    expect(boxes.line[1].position).to eq(2)
  end

  it 'should delete a box(position)' do
    boxes = Boxes.new
    box = Box.new(1, 'Anthony', 'this is Anthony\'s box')
    boxes.add(box)
    box_two = Box.new(2, 'Bernard', 'this is Bernard\'s box')
    boxes.add(box_two)
    box_three = Box.new(3, 'Charles', 'this is Charles\'s box')
    boxes.add(box_three)
    box_four = Box.new(4, 'David', 'this is David\'s box')
    boxes.add(box_four)
    expect(boxes.line.length).to eq(4)
    boxes.delete(2)
    expect(boxes.line.length).to eq(3)
  end

  it 'should reposition the boxes that follows the deleted box' do
    boxes = Boxes.new
    box = Box.new(1, 'Anthony', 'this is Anthony\'s box')
    boxes.add(box)
    box_two = Box.new(2, 'Bernard', 'this is Bernard\'s box')
    boxes.add(box_two)
    box_three = Box.new(3, 'Charles', 'this is Charles\'s box')
    boxes.add(box_three)
    box_four = Box.new(4, 'David', 'this is David\'s box')
    boxes.add(box_four)

    boxes.delete(2)
    expect(boxes.line[2].box.id).to eq(4)
    expect(boxes.line[2].position).to eq(3)
  end

  it 'should edit the position attribute when moving up the line' do
    boxes = Boxes.new
    box = Box.new(1, 'Anthony', 'this is Anthony\'s box')
    boxes.add(box)
    box_two = Box.new(2, 'Bernard', 'this is Bernard\'s box')
    boxes.add(box_two)
    box_three = Box.new(3, 'Charles', 'this is Charles\'s box')
    boxes.add(box_three)
    box_four = Box.new(4, 'David', 'this is David\'s box')
    boxes.add(box_four)
    initial_position = 4
    final_position = 2
    boxes.move_up(initial_position, final_position)
    expect(boxes.line[2].box.id).to eq(3)
    expect(boxes.line[2].position).to eq(4)
    expect(boxes.line[1].box.id).to eq(2)
    expect(boxes.line[1].position).to eq(3)
    expect(boxes.line[3].box.id).to eq(4)
    expect(boxes.line[3].position).to eq(2)
  end
end
