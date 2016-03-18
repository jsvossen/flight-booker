class FlightsController < ApplicationController

	def index
		@booking = Booking.new
		if (params[:departure])
			@flights = Flight.on_day(params[:departure]).where(from_airport_id: params[:from_airport], to_airport_id: params[:to_airport])
		end
	end

end