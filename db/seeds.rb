# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Airport.delete_all

Airport.create!(code: "SFO")
Airport.create!(code: "PDX")
Airport.create!(code: "DEN")
Airport.create!(code: "IAD")

Flight.delete_all

# generate random date
def time_rand from = 0.0, to = Time.now
  Time.at(from + rand * (to.to_f - from.to_f))
end

100.times do |n|
	airports = Airport.all.sample(2)
	departs = time_rand(Time.now, Time.local(2016,04,01))
	duration = rand(1.0..8.0).round(2)
	puts "Creating flight #{airports[0].code} -> #{airports[1].code}, #{departs}, #{duration} hrs"
	Flight.create!(to_airport_id: airports[0].id, from_airport_id: airports[1].id, departure: departs, duration: duration)
end

