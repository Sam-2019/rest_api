# frozen_string_literal: true

require "faker"


module SampleData
  include SharedFunc
  def self.generate
    Rails.logger.debug "Data"

    (1..10).each do |num|
      Institution.create!({
        name: Faker::University.name,
        location: Faker::Address.city
      })
    end

    (1..10).each do |num|
      User.create!({
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: "#{Faker::Name.first_name}@gmail.com",
        institution_id: Faker::Number.between(from: 1, to: 10),
        user_id: SharedFunc.random_code
      })
    end
  end
end
