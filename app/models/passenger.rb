class Passenger < ActiveRecord::Base

	validates :name, presence: true
	validates :email, presence: true

	has_many :bookings
	has_many :flights, :through => :bookings

end
