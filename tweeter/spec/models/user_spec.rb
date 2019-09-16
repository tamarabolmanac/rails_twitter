 

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

	it "is invalid without first_name" do
		user = User.new(first_name: nil)
	   	user.valid?
	   	expect(user.errors[:first_name]).to include("can't be blank")
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

	it "is invalid without last_name"
	it "is invalid without email"
	it "is invalid without username"
	it "is invalid without password"
end