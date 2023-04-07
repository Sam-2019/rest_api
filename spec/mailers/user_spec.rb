# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:institution) { create(:institution) }
  let(:user) { create(:user, institution_id: institution.id) }
  let(:user_without_name) { build(:user, first_name: nil, last_name: nil) }
  let(:user_without_email) { build(:user, institution_id: institution.id, email: nil) }

  describe "Validation" do
    it "without name" do

    end

    it "without email" do

    end

    it "with name and email" do
    
    end
  end
end
