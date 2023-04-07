# frozen_string_literal: true

class Dispatch
  def initialize(data)
    @data = data
  end

  def user_creation_mail
    UserMailer.welcome_email(@data).deliver_later
  end

  def user_update_mail
    UserMailer.profile_update_email(@data).deliver_later
  end

  def user_deletion_mail
    UserMailer.account_destroy_email(@data).deliver_later
  end

  def institution_creation_mail
    InstitutionMailer.welcome_email(@data).deliver_later
  end

  def institution_update_mail
    InstitutionMailer.profile_update_email(@data).deliver_later
  end

  def institution_deletion_mail
    InstitutionMailer.account_destroy_email(@data).deliver_later
  end
end
