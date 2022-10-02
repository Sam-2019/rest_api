class InstitutionMailer < ApplicationMailer
    def welcome_email(institution)
        mail(to: "#{institution.name} <#{institution.email}>", subject: 'Welcome to My Awesome Site')
    end

    def profile_update_email(institution)
        mail(to: "#{institution.name} <#{institution.email}>", subject: 'Profile Update')
    end

    def account_destroy_email(institution)
        mail(to: "#{institution.name} <#{institution.email}>", subject: 'Account Deletion')
    end
end
