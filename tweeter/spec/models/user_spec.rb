require 'spec_helper' 

RSpec.describe User, type: :model do

	describe '#full_name' do 
		it 'concatenates first and last name' do
			user = User.new(first_name: 'Tamara', last_name: 'Bolmanac')
			expect(user.full_name).to eq('Tamara Bolmanac')
		end
	end

	it "is valid with a first_name, last_name, email, username and password" do
		user = User.new(
	    	first_name: "Tamara",
	        last_name:  "Bolmanac",
	        email:      "mail@example.com",
	        username: 	"username",
	        password:   "password"
	    )
	    expect(user).to be_valid
	 end

	it "is invalid with a duplicate username" do
	    User.create(
	    	first_name:  "Nikola",
	    	last_name:  "Jokic",
	    	email:      "nikola@example.com",
	    	username:   "nikolaj",
	    	password:   "nikola123",
	    )
	    user = User.new(
	    	first_name:  "Nikola",
	    	last_name:  "Jovic",
	    	email:      "nikolajovic@example.com",
	    	username: 	 "nikolaj",
	    	password:   "nikola123"
	   )
	   user.valid?
	   expect(user.errors[:username]).to include("has already been taken")
	end

	it "is invalid without first_name" do
		user = User.new(first_name: nil)
	   	user.valid?
	   	expect(user.errors[:first_name]).to include("can't be blank")
	end

	it "is invalid without last_name" do
		user = User.new(last_name: nil)
	   	user.valid?
	   	expect(user.errors[:last_name]).to include("can't be blank")
	end


	it "is invalid without email" do
		user = User.new(email: nil)
	   	user.valid?
	   	expect(user.errors[:email]).to include("can't be blank")
	end


	it "is invalid without username" do
		user = User.new(username: nil)
	   	user.valid?
	   	expect(user.errors[:username]).to include("can't be blank")
	end

	it "is invalid without password" do
		user = User.new(password: nil)
	   	user.valid?
	   	expect(user.errors[:password]).to include("can't be blank")
	end

	describe "#followers_number" do
		it "returns number of user followers" do
			follower_user = User.create!(
		        first_name: "Dragan",
		        last_name:  "Savic",
		        email:      "dragan@example.com",
		        username: 	"dragan62129",
		        password:   "dragan123"
		    )

	    	follower_user.save

		    followed_user = User.create!(
		        first_name: "Nikola",
		        last_name:  "Jovic",
		        email:      "nikola@example.com",
		        username: 	"nikola6129",
		        password:   "nikola123"
		    )

		    followed_user.save

		    follower_user.follow(followed_user.id)

		    expect(followed_user.followers_number).to eq(1)
		end
	end

end