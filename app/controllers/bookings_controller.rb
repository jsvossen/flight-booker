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
	end


	private

		def booking_params
			params.require(:booking).permit(:flight_id, :passenger_id)
		end

end
