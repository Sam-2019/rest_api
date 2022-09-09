module InstitutionDecorator
  def institution_name
    "#{name}"
  end

  def institution_location
    "#{email}"
  end

  def current_state
    "#{state}"
  end
end
