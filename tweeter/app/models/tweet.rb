class Tweet < ApplicationRecord
	belongs_to :user

	has_secure_token

	validates :text, presence: true
	validates :text, length: { maximum: 160 }

	def number_of_a 
		self.text.scan(/a/).count + self.text.scan(/A/).count
	end
end
