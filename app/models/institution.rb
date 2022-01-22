class Institution < ApplicationRecord
    validates :name, presence: true, length: {maximum: 50 }
    validates :location, presence: true, length: {maximum: 50 }
end