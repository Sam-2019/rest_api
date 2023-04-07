# frozen_string_literal: true

require "rails_helper"

RSpec.describe Reports do
  let(:institution) { build(:institution) }

  let(:file) { "#{RAILS_ROOT_PATH}/downloads/pdf/#{institution.name.downcase}.pdf" }
  let(:pdf) { Reports::Pdf::Institution.new(institution).generate }
  let(:pdf_content) { PDF::Reader.new(file).page(1).to_s }

  it "contains institution name" do
    expect(pdf).to be_truthy
    expect(pdf_content).to include(institution.name.to_s)
  end
end
