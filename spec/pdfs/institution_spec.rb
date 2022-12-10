require 'rails_helper'

RSpec.describe Reports do
  let(:institution) { build(:institution) }
  let(:decorated_institution) { ActiveDecorator::Decorator.instance.decorate(institution) }

  let(:file) { "#{RAILS_ROOT_PATH}/downloads/pdf/#{decorated_institution.name}.pdf" }
  let(:pdf) { Reports::Pdf::Institution.new(institution).write_pdf }
  let(:pdf_content) { PDF::Reader.new(file).page(1).to_s }

  it 'contains institution name' do
    expect(pdf).to be_truthy
    expect(pdf_content).to include("#{decorated_institution.name}")
  end
end
