class PassengerMailer < ApplicationMailer
	default from: "noreply@example.com"

	def confirmation_email(user)
		@user = user
		@flight = user.flight
		mail(to: @user.email, subject: "ACME Travel - Booking Confirmation")
	end

end
