# frozen_string_literal: true
require 'faker'

module SampleData
    def self.generate
        puts "Data"

        (1..10).each do |num|
            Institution.create!({
                name: Faker::University.name,
                location: Faker::Address.city,
                state: "not_verified"
            })
        end

        (1..10).each do |num|
            User.create!({
                first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: "#{Faker::Name.first_name}@gmail.com",
                state: "not_verified",
                institution_id: Faker::Number.between(from: 1, to: 10)
            })
        end
    end
end
  