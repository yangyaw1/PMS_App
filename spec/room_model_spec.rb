require 'rails_helper'

describe Room, :type => :model do

	before do
		@room = Room.new(num: 2019,
						info: 'This is room 2019')
	end

	it "is valid with valid attributes" do
		expect(@room).to be_valid
	end

	it "is not valid without a num" do
		@room.num = nil
		expect(@room).to_not be_valid
	end

	it "is valid for without infomation" do
		@room.info = nil
		expect(@room).to be_valid
	end

	it "is not valid for infomation with length more than 50" do
		@room.info = "a"*51
		expect(@room).to_not be_valid
	end

	it "is not valid for room with same num" do
		@room.save
		room_2 = @room.dup
		room_2.info = "another room"
		expect(room_2).to_not be_valid
	end

	it "is valid for room with same info" do
		@room.save
		room_2 = @room.dup
		room_2.num = 2020
		expect(room_2).to be_valid
	end
end