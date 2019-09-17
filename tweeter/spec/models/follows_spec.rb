require 'spec_helper'

RSpec.describe Follow, type: :model do

	it "validates that pair following-followed user is unique combination" do
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

	    follow_relaton = Follow.new(
	       follower: follower_user,
	       following: followed_user
	    )

	    expect(follow_relaton).not_to be_valid
	  end
end