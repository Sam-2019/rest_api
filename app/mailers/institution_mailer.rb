class InstitutionMailer < ApplicationMailer
    def welcome_email(institution)
        return false if institution.email.blank? && institution.name.blank?
        
        mail(to: "#{institution.name} <#{institution.email}>", subject: 'Welcome to My Awesome Site') if institution.email.present?
    end

    def profile_update_email(institution)
        return false if institution.email.blank? && institution.name.blank?

        mail(to: "#{institution.name} <#{institution.email}>", subject: 'Profile Update') if institution.email.present?
    end

    def account_destroy_email(institution)
        return false if institution.email.blank? && institution.name.blank?

        mail(to: "#{institution.name} <#{institution.email}>", subject: 'Account Deletion') if institution.email.present?
    end
end
