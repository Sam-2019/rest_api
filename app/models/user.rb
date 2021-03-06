class User < ApplicationRecord
    include AASM
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    before_save {self.email = email.downcase}

    after_create :log_create_action
    after_save :log_create_action

    after_update :log_update_action
    after_destroy :log_delete_action

    belongs_to :institution

    validates :first_name, presence: true, length: {minimum: 3 ,maximum: 15}
    validates :last_name, presence: true, length: {minimum: 3 ,maximum: 50}
    validates :email, presence: true, uniqueness: {case_sensitive: false},'valid_email_2/email': { mx: true, disposable: true }

    scope :search_by_name, -> (query = nil) { where("first_name LIKE ? OR last_name LIKE ? ", "%" + query + "%", "%" + query + "%") }

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

    def get_institution(id)
      Institution.get_institution(id)
    end
   
    private
      
    def log_create_action
      puts 'User created'
    end

    def log_update_action
      puts 'User updated'
    end

    def log_delete_action
      puts 'User deleted'
    end

    def log_status_change
      puts "changing from #{aasm.from_state} to #{aasm.to_state} (event: #{aasm.current_event})"
    end

    def user_name
      "#{first_name} #{last_name}"
    end

    def user_email
      "#{email}"
    end
end

# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  first_name     :string
#  last_name      :string
#  email          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  state          :string
#  institution_id :integer
#  user_id        :string
#
# Indexes
#
#  index_users_on_email           (email) UNIQUE
#  index_users_on_institution_id  (institution_id)
#
