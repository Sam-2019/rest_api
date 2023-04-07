# frozen_string_literal: true

class InstitutionMailer < ApplicationMailer
  def welcome_email(institution)
    return false if institution.email.blank? && institution.name.blank?
    file_name = institution.name.downcase

    if FileTest.exist?("#{@filepath}#{file_name}.pdf")
      attachments["#{file_name}.pdf"] = File.read("#{@filepath}#{file_name}.pdf")
      build(institution, I18n.t("mailer.subject.welcome"))
    else
      Reports::Pdf::Institution.new(institution).generate
      InstitutionMailer.welcome_email(institution).deliver_now
    end
  end

  def profile_update_email(institution)
    build(institution, I18n.t("mailer.subject.update"))
  end

  def account_destroy_email(institution)
    build(institution, I18n.t("mailer.subject.deletion"))
  end

  private

  def build(institution, subject)
    @institution = institution
    return false if institution.email.blank? || institution.name.blank?

    mail(to: "#{institution.email} <#{institution.name}>", subject: subject)
  end
end
