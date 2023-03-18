# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:institution) { create(:institution) }
  let(:user) { create(:user, institution_id: institution.id) }
  let(:user_without_name) { build(:user, first_name: nil, last_name: nil) }
  let(:user_without_email) { build(:user, institution_id: institution.id, email: nil) }

  describe "Validation" do
    it "without name" do
      expect(user_without_name.valid?).to be false
    end

    it "without email" do
      expect(user_without_email.valid?).to be false
    end

    it "with name and email" do
      email = UserMailer.welcome_email(user)

      expect(user.valid?).to be true
      # expect(email.from).to eq('from@example.com')
      # expect(email.to).to eq('School+1')
      # expect(email.subject).to eq('Welcome to My Awesome Site')
      # expect(email.user_name).to eq('School+1')
    end
  end
end
