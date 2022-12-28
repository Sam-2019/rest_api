require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:user) { build(:user) }
  let(:user_without_name) { build(:user, name: nil) }
  let(:user_without_email) { build(:user, email: nil) }

  describe "Validation" do
    it "without name" do
      email = UserMailer.welcome_email(user_without_name).deliver_now
      expect(email).to be_falsy
    end

    it "without email" do
      email = UserMailer.welcome_email(user_without_email).deliver_now
      expect(email).to be_falsy
    end
  
    it "with name and email" do
      email = UserMailer.welcome_email(user).deliver_now
      expect(pdf).to be_truthy
    end
  end
end
