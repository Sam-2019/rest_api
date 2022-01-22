class User < ApplicationRecord
    validates :first_name, presence: true, length: {maximum: 15}
    validates :last_name, presence: true, length: {maximum: 50}
    validates :email, presence: true, length: {maximum: 250}
end
