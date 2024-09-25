# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create airports
ActiveRecord::Base.connection.reset_pk_sequence!('airports')
ActiveRecord::Base.connection.reset_pk_sequence!('flights')
ActiveRecord::Base.connection.reset_pk_sequence!('bookings')
ActiveRecord::Base.connection.reset_pk_sequence!('passengers')
Airport.create!([{ code: 'SFO' }, { code: 'NYC' }, { code: 'LAX' }, { code: 'ORD' }, { code: 'ATL' }, { code: 'DFW' }, { code: 'DEN' }, { code: 'LAS' }, { code: 'PHX' }, { code: 'MIA' }])


airports = Airport.all
300.times do
  departure_airport = airports.sample
  arrival_airport = airports.sample
  next if departure_airport == arrival_airport

  Flight.create!(
    departure_airport: departure_airport,
    arrival_airport: arrival_airport,
    start_datetime: Faker::Time.forward(days: 30),
    duration: rand(1..6) * 60
  )
end
