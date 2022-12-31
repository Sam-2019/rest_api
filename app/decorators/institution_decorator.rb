module InstitutionDecorator
  def institution_name
    "#{name}"
  end

  def institution_location
    "#{location}"
  end

  def current_state
    "#{state}"
  end

  def email_address
    "#{email}"
  end
end
