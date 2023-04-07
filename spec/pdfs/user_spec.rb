# frozen_string_literal: true

require "rails_helper"

RSpec.describe Reports do
  let(:user) { build(:user) }

  let(:file) { "#{RAILS_ROOT_PATH}/downloads/pdf/#{user.name}.pdf" }
  let(:pdf) { Reports::Pdf::User.new(user).generate }

  it "contains hello & user name" do
    expect(pdf).to be_truthy
  end
end
