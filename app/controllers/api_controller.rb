# frozen_string_literal: true

class ApiController < ActionController::API
  rescue_from (ActiveRecord::RecordNotFound) { |exception| exception_error }
  include ActionController::MimeResponds

  private

  def exception_error
    render json: true, status: :no_content
  end
end
