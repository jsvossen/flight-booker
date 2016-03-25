class PassengerMailer < ApplicationMailer
	default from: "noreply@example.com"

	def confirmation_email(user, flight)
		@user = user
		@flight = flight
		mail(to: @user.email, subject: "ACME Travel - Booking Confirmation")
	end

end
