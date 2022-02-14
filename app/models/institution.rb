class Institution < ApplicationRecord
    has_many :users
    validates :name, presence: true, length: {maximum: 50 }
    validates :location, presence: true, length: {maximum: 50 }

    scope :search_by_location, -> (location = nil) { where(location: location) }
    scope :search_by_name, -> (name = nil) { where(name: name) }
end

# == Schema Information
#
# Table name: institutions
#
#  id         :integer          not null, primary key
#  name       :string
#  location   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
