require "rails_helper"

RSpec.describe InstitutionMailer, type: :mailer do
  let(:institution) { build(:institution) }
  let(:institution_without_name) { build(:institution, name: nil) }
  let(:institution_without_email) { build(:institution, email: nil) }

  describe "Validation" do
    it "without name" do
      email = InstitutionMailer.welcome_email(institution_without_name).deliver_now
      expect(email).to be_falsy
    end

    it "without email" do
      email = InstitutionMailer.welcome_email(institution_without_email).deliver_now
      expect(email).to be_falsy
    end

    it "with name and email" do
      email = InstitutionMailer.welcome_email(institution).deliver_now
      expect(email).to be_truthy
    end
  end
end
