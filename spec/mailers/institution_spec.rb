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
      # expect(email.from).to eq('from@example.com')
      # expect(email.to).to eq('School+1')
      # expect(email.subject).to eq('Welcome to My Awesome Site')
      # expect(email.institution_name).to eq('School+1')
    end
  end
end