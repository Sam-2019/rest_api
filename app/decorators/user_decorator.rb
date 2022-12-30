module UserDecorator
  def user_name
    "#{first_name} #{last_name}"
  end

  def email_address
    "#{email}"
  end

  def current_state
    "#{state}"
  end
end