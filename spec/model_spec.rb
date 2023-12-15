# spec/model_spec.rb

require './model.rb'


RSpec.describe Model do

  before(:all) do
    Box = Struct.new(:name,:order,:id)

    @box_1 = Box.new(name: "Propose", order: 1, id: 1)
    @box_2 = Box.new(name: "Planning", order: 2, id: 2)
    @box_3 = Box.new(name: "Doing", order: 3, id: 3)
    @box_4 = Box.new(name: "Completed", order: 4, id: 4)

    @boxes = Array.new

    @boxes =[@box_1, @box_2, @box_3, @box_4]
  end

    it 'should have an attribute array containing all the boxes' do 
      model = Model.new(@boxes)
      expect(model).to have_attributes(boxes:@boxes)
    end

    it 'should have a find method' do
      model = Model.new(@boxes)
      expect(model).to respond_to(:find)
    end

    it 'find should return the index of the box' do
      model = Model.new(@boxes)
      box = @box_2
      expect(model.find(box)).to eq 1
    end

    it 'should have a swap method' do
      model = Model.new(@boxes)
      expect(model).to respond_to(:swap)
    end

    it 'swap box_4 and box_2' do
      model = Model.new(@boxes)
      model.swap(@box_4,@box_2)
      p model.boxes
      expect(model.boxes[1].name).to eq 'Completed'
      expect(model.boxes[3].name).to eq 'Planning'
    end
end
