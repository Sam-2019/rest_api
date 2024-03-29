# frozen_string_literal: true

FactoryBot.define do
  factory :institution do
    sequence :name do |n|
      "School+#{n}"
    end

    sequence :location do |n|
      "World+#{n}"
    end

    sequence :email do |n|
      "School+#{n}@example#{n}.com"
    end

    state { "not_verified" }
  end
end
