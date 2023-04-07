# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  before_action :set_file_path
  default from: "from@example.com"
  layout "mailer"

  private

  def set_file_path
    @filepath = "#{RAILS_ROOT_PATH}/downloads/pdf/"
  end
end
