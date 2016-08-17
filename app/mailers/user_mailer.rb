class UserMailer < ApplicationMailer
	default from: 'no-reply@linkassigner.com'

	def welcome_email(user, link_assigned)
		@user = user
		@user.link_assigned = link_assigned
		@url = 'https://frozen-scrubland-60301.herokuapp.com/login'
		mail(to: @user.email, subject: 'Welcome to Random Link Assignment System')
	end
end
