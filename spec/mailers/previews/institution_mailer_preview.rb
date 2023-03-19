# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/institution
class InstitutionMailerPreview < ActionMailer::Preview
  def welcome_email
    institution = Institution.last
    InstitutionMailer.welcome_email(institution)
  end

  def profile_update_email
    institution = Institution.last
    InstitutionMailer.profile_update_email(institution)
  end

  def account_destroy_email
    institution = Institution.last
    InstitutionMailer.account_destroy_email(institution)
  end
end
