# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/user
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    user = User.last
    UserMailer.welcome_email(user)
  end

  def profile_update_email
    user = User.last
    UserMailer.profile_update_email(user)
  end

  def account_destroy_email
    user = User.last
    UserMailer.account_destroy_email(user)
  end
end
