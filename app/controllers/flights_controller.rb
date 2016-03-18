class FlightsController < ApplicationController

	def index
		@flights = Flight.where(
			from_airport_id: params[:from_airport],
			to_airport_id: params[:to_airport]
		)
	end

end


# "from_airport_id = ? AND to_airport_id = ? AND strftime('%Y-%m-d', departure) = ?",
# 			params[:from_airport],
# 			params[:to_airport],
# 			params[:departure]