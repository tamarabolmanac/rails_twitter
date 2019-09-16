class Tweet < ApplicationRecord
	belongs_to :user

	validates :text, presence: true

	def number_of_a 
		num = self.text.scan(/a/).count + self.text.scan(/A/).count
	end
end
