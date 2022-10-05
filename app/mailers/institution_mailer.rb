class InstitutionMailer < ApplicationMailer
    def welcome_email(institution)
        build(institution, "Welcome to My Awesome Site")
    end

    def profile_update_email(institution)
        build(institution, "Profile Update")
    end

    def account_destroy_email(institution)
        build(institution, "Account Deletion")
    end

    private

    def build(institution, subject)
        return false if institution.email.blank? && institution.name.blank?

        mail(to: "#{institution.name} <#{institution.email}>", subject: subject)
    end
end
