# frozen_string_literal: true

require "rails_helper"

RSpec.describe Institution, type: :model do
  let(:institution) { build(:institution) }
  let(:institution_without_name) { build(:institution, name: nil) }
  let(:institution_without_location) { build(:institution, location: nil) }
  let(:verified_institution) { build(:institution, state: "verified") }

  describe "Validation" do
    it "without name" do
      expect(institution_without_name.valid?).to be false
    end

    it "without location" do
      expect(institution_without_location.valid?).to be false
    end

    it "with valid attributes" do
      expect(institution.valid?).to be true
    end

    it "verified" do
      expect(verified_institution.state).to eq("verified")
    end
  end

  describe "Transitions" do
    it "should have state not_verified" do
      expect(institution).to have_state(:not_verified)
      expect(institution).not_to have_state(:verified)
      expect(institution).not_to have_state(:not_approved)
      expect(institution).not_to have_state(:approved)
    end

    it "should transition from not_verified to verified" do
      expect(institution).to have_state(:not_verified)
      expect(institution).to transition_from(:not_verified).to(:verified).on_event(:verify)
      expect(institution).to have_state(:verified)
    end

    it "should transition from verified to not_approved" do
      institution = create(:institution, state: "verified")
      expect(institution).to have_state(:verified)
      expect(institution).to transition_from(:verified).to(:not_approved).on_event(:pending_approval)
      expect(institution).to have_state(:not_approved)
    end

    it "should transition from not_approved to approved" do
      institution = create(:institution, state: "not_approved")
      expect(institution).to have_state(:not_approved)
      expect(institution).to transition_from(:not_approved).to(:approved).on_event(:approve)
      expect(institution).to have_state(:approved)
    end

    it "should not transition from not_verified" do
      expect(institution).to have_state(:not_verified)
      expect(institution).to_not allow_transition_to(:not_approved)
      expect(institution).to_not allow_transition_to(:approved)
    end

    it "should not transition from verified" do
      institution = create(:institution, state: "verified")
      expect(institution).to have_state(:verified)
      expect(institution).to_not allow_transition_to(:not_verified)
      expect(institution).to_not allow_transition_to(:approved)
    end

    it "should not transition from not_approved" do
      institution = create(:institution, state: "not_approved")
      expect(institution).to have_state(:not_approved)
      expect(institution).to_not allow_transition_to(:not_verified)
      expect(institution).to_not allow_transition_to(:verified)
    end

    it "should not transition from approved" do
      institution = create(:institution, state: "approved")
      expect(institution).to have_state(:approved)
      expect(institution).to_not allow_transition_to(:not_verified)
      expect(institution).to_not allow_transition_to(:verified)
      expect(institution).to_not allow_transition_to(:not_approved)
      expect(institution).to_not allow_transition_to(:verified)
    end
  end
end
