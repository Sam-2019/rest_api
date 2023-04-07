require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Institution.destroy_all
User.destroy_all

10.times do
  Institution.create!({
    name: Faker::University.name,
    location: Faker::Address.state,
    email: "support@#{Faker::University.name.downcase.delete(" ")}.com"
  })
end
p "Created #{Institution.count} institution"

10.times do
  User.create!({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    institution_id: Faker::Number.between(from: 1, to: 10)
  })
end
p "Created #{User.count} user"
