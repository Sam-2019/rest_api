FactoryBot.define do
  factory :user do
    sequence :first_name do |n|
      "First+#{n}"
    end
    sequence :last_name do |n|
      "Last+#{n}"
    end
    sequence :email do |n|
      "email+#{n}@example.com"
    end
  end
end
