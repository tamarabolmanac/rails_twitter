require 'spec_helper'

RSpec.describe Tweet, type: :model do 
	describe '#number_of_a' do
		it "counts letters a in tweet text" do
			tweet = Tweet.new
			tweet.text = "Hello from another planet!"
			expect(tweet.number_of_a).to eq(2)
		end
	end

	it "validates length of tweet text" do
	    expect(Tweet.new(:text => "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, na"))
	    .to_not be_valid
	end

end