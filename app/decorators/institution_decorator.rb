# frozen_string_literal: true

module InstitutionDecorator
  def institution_name
    name.to_s
  end

  def institution_location
    location.to_s
  end

  def current_state
    state.to_s
  end

  def email_address
    email.to_s
  end
end
