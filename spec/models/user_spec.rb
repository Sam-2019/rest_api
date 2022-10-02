require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  let(:user_without_first_name) { build(:user, first_name: nil) }
  let(:user_without_last_name) { build(:user, last_name: nil) }
  let(:user_without_email) { build(:user, email: nil) }
  let(:verified_user) { build(:user, state: 'verified') }

  describe "Validation" do
    it "without first name" do
      expect(user_without_first_name.valid?).to be false
      expect(user_without_first_name.errors.full_messages).to include("First name can't be blank")
      expect(user_without_first_name.errors.full_messages).to include("First name is too short (minimum is 3 characters)")
    end
  
    it "without last name" do
      expect(user_without_last_name.valid?).to be false
      expect(user_without_last_name.errors.full_messages).to include("Last name can't be blank")
      expect(user_without_last_name.errors.full_messages).to include("Last name is too short (minimum is 3 characters)")
    end
  
    it "without email" do
      expect(user_without_email.valid?).to be false
      expect(user_without_email.errors.full_messages).to include("Email can't be blank")
    end

    it "with valid attributes" do
      expect(user.valid?).to be true
    end

    it "verified" do
      expect(verified_user.state).to eq("verified")
    end
  end
end
