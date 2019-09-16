class UserMailer < ApplicationMailer

	default from: 'marvinthemartian995@gmail.com'

	def new_follower(user, current)
		@current = current
		@user = user
		@url  = 'http://example.com/follow'
		mail(to: @user.email, subject: "You have one new follower")
	end

end
