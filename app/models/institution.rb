class Institution < ApplicationRecord
    has_many :users
    validates :name, presence: true, length: {maximum: 50 }
    validates :location, presence: true, length: {maximum: 50 }
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
