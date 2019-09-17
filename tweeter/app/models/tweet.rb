class Tweet < ApplicationRecord
	belongs_to :user

	validates :text, presence: true
	validates :text, length: { maximum: 160 }, allow_nil: true, :on => :publication

	def number_of_a 
		self.text.scan(/a/).count + self.text.scan(/A/).count
	end

	before_create :generate_token

	protected

	def generate_token
	  self.token = loop do
	    random_token = SecureRandom.urlsafe_base64(nil, false)
	    break random_token unless Tweet.exists?(token: random_token)
	  end
	end

end
