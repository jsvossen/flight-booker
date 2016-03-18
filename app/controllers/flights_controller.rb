class FlightsController < ApplicationController

	def index
		if (params[:departure])
			@flights = Flight.on_day(params[:departure]).where(from_airport_id: params[:from_airport], to_airport_id: params[:to_airport])
		end
		render :index
	end

end