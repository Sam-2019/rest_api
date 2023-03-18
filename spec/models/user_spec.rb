# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  let(:verified_user) { build(:user, state: "verified") }

  describe "Validation" do
    it "without first name" do
      user_without_first_name = build(:user, first_name: nil)
      expect(user_without_first_name.valid?).to be false
      expect(user_without_first_name.errors.full_messages).to include("First name can't be blank")
      expect(user_without_first_name.errors.full_messages).to include("First name is too short (minimum is 3 characters)")
    end

    it "without last name" do
      user_without_last_name = build(:user, last_name: nil)
      expect(user_without_last_name.valid?).to be false
      expect(user_without_last_name.errors.full_messages).to include("Last name can't be blank")
      expect(user_without_last_name.errors.full_messages).to include("Last name is too short (minimum is 3 characters)")
    end

    it "without email" do
      user_without_email = build(:user, email: nil)
      expect(user_without_email.valid?).to be false
      expect(user_without_email.errors.full_messages).to include("Email can't be blank")
    end

    it "with valid attributes" do
      expect(user.valid?).to be false
    end

    it "verified" do
      expect(verified_user.state).to eq("verified")
    end

    describe "Transitions" do
      it "should have state not_verified" do
        expect(user).to have_state(:not_verified)
        expect(user).not_to have_state(:verified)
        expect(user).not_to have_state(:not_approved)
        expect(user).not_to have_state(:approved)
      end

      it "should transition from not_verified to verified" do
        expect(user).to have_state(:not_verified)
        expect(user).to transition_from(:not_verified).to(:verified).on_event(:verify)
        expect(user).to have_state(:verified)
      end

      it "should transition from verified to not_approved" do
        user = build(:user, state: "verified")
        expect(user).to have_state(:verified)
        expect(user).to transition_from(:verified).to(:not_approved).on_event(:pending_approval)
        expect(user).to have_state(:not_approved)
      end

      it "should transition from not_approved to approved" do
        user = build(:user, state: "not_approved")
        expect(user).to have_state(:not_approved)
        expect(user).to transition_from(:not_approved).to(:approved).on_event(:approve)
        expect(user).to have_state(:approved)
      end

      it "should not transition from not_verified" do
        expect(user).to have_state(:not_verified)
        expect(user).to_not allow_transition_to(:not_approved)
        expect(user).to_not allow_transition_to(:approved)
      end

      it "should not transition from verified" do
        user = build(:user, state: "verified")
        expect(user).to have_state(:verified)
        expect(user).to_not allow_transition_to(:not_verified)
        expect(user).to_not allow_transition_to(:approved)
      end

      it "should not transition from not_approved" do
        user = build(:user, state: "not_approved")
        expect(user).to have_state(:not_approved)
        expect(user).to_not allow_transition_to(:not_verified)
        expect(user).to_not allow_transition_to(:verified)
      end

      it "should not transition from approved" do
        user = build(:user, state: "approved")
        expect(user).to have_state(:approved)
        expect(user).to_not allow_transition_to(:not_verified)
        expect(user).to_not allow_transition_to(:verified)
        expect(user).to_not allow_transition_to(:not_approved)
        expect(user).to_not allow_transition_to(:verified)
      end
    end
  end
end
