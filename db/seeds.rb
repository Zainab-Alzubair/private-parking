# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
working_hours = [
  { day: 'Sunday', start_time: '09:00', end_time: '17:00' },
  { day: 'Monday', start_time: '08:30', end_time: '16:30' },
  { day: 'Tuesday', start_time: '09:00', end_time: '17:00' },
  { day: 'Wednesday', start_time: '08:30', end_time: '16:30' },
  { day: 'Thursday', start_time: '09:00', end_time: '17:00' },
  { day: 'Friday', start_time: '08:30', end_time: '16:30' },
  { day: 'Saturday', start_time: '09:00', end_time: '13:00' }
]

working_hours.each do |working_hour|
  WorkingHour.create(working_hour)
end