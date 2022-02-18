class User < ApplicationRecord
    before_save {self.email = email.downcase}

    validates :first_name, presence: true, length: {maximum: 15}
    validates :last_name, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 250},
                        format: {with: VALID_EMAIL_REGEX}, 
                        uniqueness: {case_sensitive: true}

    scope :search_by_name, -> (query = nil) { where("first_name LIKE ? OR last_name LIKE ? ", "%" + query + "%", "%" + query + "%")}
end

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  verified   :integer
#  approved   :integer
#  state      :string
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
