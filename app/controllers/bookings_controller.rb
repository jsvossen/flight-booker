class BookingsController < ApplicationController

	def new
		if !params[:booking][:flight_id]
			flash[:danger] = "Please select a flight."
			redirect_to flights_path and return
		else
			@num = params[:booking][:num_tickets].to_i
			@booking = Booking.new(booking_params)
			@num.times { @booking.passengers.build }
		end
	end

	def create
		@booking = Booking.new(booking_params)
		if @booking.save
			@booking.passengers.each do |user|
				PassengerMailer.confirmation_email(user, @booking.flight).deliver_later
			end
			flash[:success] = "Booking successful!"
			redirect_to @booking
		else
			flash.now[:danger] = "Error: #{@booking.errors.full_messages.join('. ')}."
			render :new
		end
	end

	def show
		@booking = Booking.find(params[:id])
	end


	private

		def booking_params
			params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
		end

end
