# frozen_string_literal: true

class User < ApplicationRecord
  has_paper_trail
  include AASM

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i

  before_save { self.email = email.downcase }

  after_commit :log_commit_action

  after_update :log_update_action
  after_destroy :log_delete_action

  belongs_to :institution

  validates :first_name, presence: true, length: {minimum: 3, maximum: 15}
  validates :last_name, presence: true, length: {minimum: 3, maximum: 50}
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  # validates :attribute, phone: { possible: true, allow_blank: true, types: [:voip, :mobile], country_specifier: -> phone { phone.country.try(:upcase) } }

  scope :active, ->(query = false) { where(soft_delete: query) }
  scope :inactive, ->(query = true) { where(soft_delete: query) }
  scope :search_by_name, lambda { |query = nil|
                           active.where("first_name LIKE ? OR last_name LIKE ? ", "%" + query + "%", "%" + query + "%")
                         }
  scope :verified, ->(query = "verified") { active.where(state: query) }
  scope :not_verified, ->(query = "not_verified") { active.where(state: query) }
  scope :approved, ->(query = "approved") { active.where(state: query) }
  scope :not_approved, ->(query = "not_approved") { active.where(state: query) }

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

  def name
    "#{first_name} #{last_name}"
  end


  private

  def log_commit_action
    Rails.logger.debug "User saved"
  end

  def log_update_action
    Rails.logger.debug "User updated"
  end

  def log_delete_action
    Rails.logger.debug "User deleted"
  end

  def log_status_change
    Rails.logger.debug "changing from #{aasm.from_state} to #{aasm.to_state} (event: #{aasm.current_event})"
  end

  def generate_pdf
    Reports::Pdf::User.new(self)
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
#  soft_delete    :boolean          default("0")
#
# Indexes
#
#  index_users_on_email           (email) UNIQUE
#  index_users_on_institution_id  (institution_id)
#
