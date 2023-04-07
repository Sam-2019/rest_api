# frozen_string_literal: true

require "rails_helper"

RSpec.describe InstitutionMailer, type: :mailer do
  let(:institution_without_name) { build(:institution, name: nil) }
  let(:institution_without_email) { build(:institution, email: nil) }
  let(:institution) { create(:institution) }

  describe "Validation" do
    it "without name" do
    end

    it "without email" do
    end

    it "with name and email" do
    end
  end
end
