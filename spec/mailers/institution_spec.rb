# frozen_string_literal: true

require "rails_helper"

RSpec.describe InstitutionMailer, type: :mailer do
  let(:institution_without_name) { build(:institution, name: nil) }
  let(:institution_without_email) { build(:institution, email: nil) }
  let(:institution) { create(:institution) }

  describe "Validation" do
    it "without name" do
      expect(institution_without_name.valid?).to be false
    end

    it "without email" do
      expect(institution_without_email.valid?).to be false
    end

    it "with name and email" do
      email = InstitutionMailer.welcome_email(institution)

      expect(institution.valid?).to be true
    end
  end
end
