require 'rails_helper'

RSpec.describe Reports do
  let(:user) { build(:user) }
  let(:decorated_user) { ActiveDecorator::Decorator.instance.decorate(user) }

  let(:file) { "#{RAILS_ROOT_PATH}/downloads/pdf/#{decorated_user.user_name}.pdf" }
  let(:pdf) { Reports::Pdf::User.new(user).write_pdf }
  let(:pdf_content) { PDF::Reader.new(file).page(1).to_s }

  it 'contains hello & user name' do
    expect(pdf).to be_truthy
    expect(pdf_content).to include('Hello')
    expect(pdf_content).to include("#{decorated_user.user_name}")
  end
end
