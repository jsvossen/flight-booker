class FlightsController < ApplicationController

	def index
		@booking = Booking.new
		if (params[:from_airport] || params[:to_airport])
			@flights = Flight.where(from_airport_id: params[:from_airport], to_airport_id: params[:to_airport])
			@flights = @flights.on_day(params[:departure]) if params[:departure] && !params[:departure].empty?
		end
	end

end