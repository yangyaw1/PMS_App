require 'rails_helper'

describe User, :type => :model do

	before do
		@user = User.new(name: 'example', 
						email: 'example@gmail.com',
						password: '123456789',
						password_confirmation: '123456789')
	end

	it "is valid with valid attributes" do
		expect(@user).to be_valid
	end

	it "is not valid without a name" do
		@user.name = nil
		expect(@user).to_not be_valid
	end

	it "is not valid for invalid email" do
		@user.email = nil
		expect(@user).to_not be_valid
	end

	it "is not valid for name with length more than 50" do
		@user.name = "a"*51
		expect(@user).to_not be_valid
	end

	it "is not valid for email with length more than 50" do
		@user.email = "a"*41 + '@gmail.com'
		expect(@user).to_not be_valid
	end

	it "is valid for valid email format" do
		valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
 first.last@foo.jp alice+bob@baz.cn]
 		valid_addresses.each do |valid_address|
 			@user.email = valid_address
 			expect(@user).to be_valid
		end
	end

	it "is not valid for invalid email format" do
		invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
 foo@bar_baz.com foo@bar+baz.com]
		invalid_addresses.each do |invalid_address|
 			@user.email = invalid_address
 			expect(@user).to_not be_valid
		end
	end

	it "is not valid for short password" do
		@user.password = "a"*5
		expect(@user).to_not be_valid
	end

	it "is not valid for users with same email " do
		@user.save
		user_2 = @user.dup 
		expect(user_2).to_not be_valid
	end
end