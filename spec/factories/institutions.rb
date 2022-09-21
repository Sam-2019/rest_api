FactoryBot.define do
  factory :institution do
    sequence :name do |n|
      "School+#{n}"
    end

    sequence :location do |n|
      "World+#{n}"
    end
  end
end
