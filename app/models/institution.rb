class Institution < ApplicationRecord
    include AASM

    after_commit :log_commit_action

    after_update :log_update_action
    after_destroy :log_delete_action

    has_many :users

    validates :name, presence: true, length: {minimum: 3 ,maximum: 50 }
    validates :location, presence: true, length: {maximum: 50 }

    scope :active, -> (query = false) { where(soft_delete: query) }
    scope :inactive, -> (query = true) { where(soft_delete: query) }
    scope :search_by_location, -> (location = nil) { active.where(location: location) }
    scope :search_by_name, -> (name = nil) { active.where(name: name) }
    scope :get_institution, -> (query = nil) { active.where(id: query) }
    scope :verified, -> (query = "verified") {active.where(state: query) }
    scope :not_verified, -> (query = "not_verified") { active.where(state: query) }
    scope :approved, -> (query = "approved") { active.where(state: query) }
    scope :not_approved, -> (query = "not_approved") { active.where(state: query) }


    aasm column: :state do # default column: aasm_state
      state :not_verified, initial: true
      state :verified, :not_approved, :approved

      after_all_transitions :log_status_change
  
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

    private 

    def log_commit_action
      puts 'Institution saved'
    end

    def log_update_action
      puts 'Institution updated'
    end

    def log_delete_action
      puts 'Institution deleted'
    end

    def log_status_change
      puts "changing from #{aasm.from_state} to #{aasm.to_state} (event: #{aasm.current_event})"
    end
end

# == Schema Information
#
# Table name: institutions
#
#  id          :integer          not null, primary key
#  name        :string
#  location    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  state       :string
#  soft_delete :boolean
#
