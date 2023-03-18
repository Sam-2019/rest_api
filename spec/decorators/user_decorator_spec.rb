# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserDecorator do
  let(:user) { build(:user) }
  let(:verified_user) { build(:user, state: "verified") }
  let(:decorated_user) { ActiveDecorator::Decorator.instance.decorate(user) }
  let(:decorated_verified_user) { ActiveDecorator::Decorator.instance.decorate(verified_user) }

  describe "user" do
    it "full name" do
      expect(decorated_user.name).to eq("First+1 Last+1")
      expect(decorated_user.name).to include("First+")
      expect(decorated_user.name).to include("Last+")
    end

    it "email address" do
      expect(decorated_user.email_address).to eq("email+2@example.com")
      expect(decorated_user.email_address).to include("email+")
      expect(decorated_user.email_address).to include("@example.com")
    end

    it "state" do
      expect(decorated_user.current_state).to eq("not_verified")
      expect(decorated_verified_user.current_state).to eq("verified")
    end
  end
end
