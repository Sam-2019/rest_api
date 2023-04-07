# frozen_string_literal: true

class UserMailer < ApplicationMailer

  def welcome_email(user)
    return false if user.email.blank? && user.name.blank?
    file_name = user.name.downcase

    if FileTest.exist?("#{@filepath}#{file_name}.pdf")
      attachments["#{file_name}.pdf"] = File.read("#{@filepath}#{file_name}.pdf")
      build(user, I18n.t('mailer.subject.welcome'))
    else
      Reports::Pdf::User.new(user).generate
      UserMailer.welcome_email(user).deliver_now
    end
  end

  def profile_update_email(user)
    build(user, I18n.t('mailer.subject.update'))
  end

  def account_destroy_email(user)
    build(user, I18n.t('mailer.subject.deletion'))
  end

private

  def build(user, subject)
    @user = user
    return false if user.email.blank? || user.name.blank?

    mail(to: "#{user.name} <#{user.email}>", subject: subject)
  end
end
