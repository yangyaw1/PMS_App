require 'rails_helper'

describe User, :type => :model do

	before do
		@user1 = User.create!(name:  'user1',
		                 email: 'user1@gmail.com',
		                 password:              'user10000',
		                 password_confirmation: 'user10000')
		@user2 = User.create!(name:  'user2',
		                 email: 'user2@gmail.com',
		                 password:              'user20000',
		                 password_confirmation: 'user20000')
		@room1 = Room.create!(num: 2019,
							  info: 'It is room1')
		@room2 = Room.create!(num: 2020,
							  info: 'It is room2')

		@booking = Booking.new(user_id: @user1.id, room_id: @room1.id)
	end

	it "is valid with valid attributes" do
		expect(@booking).to be_valid
	end

	it "is valid if booking matches the user" do
		@booking.save
		@booking.user.should eql(@user1)
	end

	it "is valid if booking matches the room" do
		@booking.save
		@booking.room.should eql(@room1)
	end

	it "is valid if user matches the room" do
		@booking.save
		@user1.room.should eql(@room1)
	end

	it "is valid if room matches the user" do
		@booking.save
		@room1.user.should eql(@user1)
	end

	it "is not valid without user id" do
		@booking.user_id = nil
		expect(@booking).to_not be_valid
	end

	it "is not valid if user id does not exist" do
		@booking.user_id = User.last.id + 1
		expect(@booking).to_not be_valid
	end

	it "is not valid without room id" do
		@booking.room_id = nil
		expect(@booking).to_not be_valid
	end

	it "is not valid if room id does not exist" do
		@booking.room_id = Room.last.id + 1
		expect(@booking).to_not be_valid
	end

	it "is not valid with same user id" do
		@booking.save
		booking_2 = Booking.new(user_id: @user1.id, room_id: @room2.id)
		expect(booking_2).to_not be_valid
	end

	it "is not valid with same room id" do
		@booking.save
		booking_2 = Booking.new(user_id: @user2.id, room_id: @room1.id)
		expect(booking_2).to_not be_valid
	end

	it "is valid for user lose connection to booking and room once booking is deleted" do
		@booking.save
		@booking.destroy
		@user1.booking.should eql(nil)
		@user1.room.should eql(nil)
	end

	it "is valid for room lose connection to booking and user once booking is deleted" do
		@booking.save
		@booking.destroy
		@room1.booking.should eql(nil)
		@room1.user.should eql(nil)
	end

	it "is valid for booking being deleted if user is deleted" do
		@booking.save
		id = @booking.id
		@user1.destroy
		Booking.exists?(id).should eql(false)
	end

	it "is valid for booking being deleted if room is deleted" do
		@booking.save
		id = @booking.id
		@room1.destroy
		Booking.exists?(id).should eql(false)
	end
end