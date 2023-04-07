# frozen_string_literal: true

require "rails_helper"

RSpec.describe Reports do
  let(:institution) { build(:institution) }

  let(:file) { "#{RAILS_ROOT_PATH}/downloads/pdf/#{institution.name.downcase}.pdf" }
  let(:pdf) { Reports::Pdf::Institution.new(institution).generate }

  it "contains institution name" do
    expect(pdf).to be_truthy
  end
end
