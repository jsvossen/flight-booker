class Flight < ActiveRecord::Base

	scope :by_date, -> { order(:departure) }

	belongs_to :to_airport, class_name: "Airport"
	belongs_to :from_airport, class_name: "Airport"

	def date_short
		departure.strftime("%Y-%m-%d")
	end

	def date_formatted_short
		departure.strftime("%m/%d/%Y")
	end

	def date_formatted_full
		departure.strftime("%b %d, %Y - %I:%M%p")
	end

end
