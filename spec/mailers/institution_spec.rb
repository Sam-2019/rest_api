require "rails_helper"

RSpec.describe InstitutionMailer, type: :mailer do
  let(:institution_without_name) { build(:institution, name: nil) }
  let(:institution_without_email) { build(:institution, email: nil) }

  describe "Validation" do
    it "without name" do
      expect(institution_without_name.valid?).to be false
    end

    it "without email" do
      expect(institution_without_email.valid?).to be false
    end

    it "with name and email" do
    end
  end
end