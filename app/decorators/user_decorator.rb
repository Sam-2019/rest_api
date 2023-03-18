# frozen_string_literal: true

module UserDecorator
  def name
    "#{first_name} #{last_name}"
  end

  def email_address
    email.to_s
  end

  def current_state
    state.to_s
  end
end
