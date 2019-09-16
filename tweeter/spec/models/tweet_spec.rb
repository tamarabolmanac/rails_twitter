require 'spec_helper'

RSpec.describe Tweet, type: :model do 
	describe '#number_of_a' do
		it "counts letters a in tweet text" do
			tweet = Tweet.new
			tweet.text = "Hello from another planet!"
			expect(tweet.number_of_a).to eq(2)
		end
	end

end