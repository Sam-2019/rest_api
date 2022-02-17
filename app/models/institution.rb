class Institution < ApplicationRecord
    include AASM

    has_many :users
    validates :name, presence: true, length: {maximum: 50 }
    validates :location, presence: true, length: {maximum: 50 }

    scope :search_by_location, -> (location = nil) { where(location: location) }
    scope :search_by_name, -> (name = nil) { where(name: name) }


    aasm column: :state do # default column: aasm_state
      state :not_verified, initial: true
      state :verified, :not_approved, :approved
  
      event :verify do
        transitions from: :not_verified, to: :verified
      end
  
      event :pending_approval do
        transitions from: :verified, to: :not_approved
      end

      event :approve do
        transitions from: :not_approved, to: :approved
      end
    end
  
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
#  verified   :integer
#  approved   :integer
#
