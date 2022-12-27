# Preview all emails at http://localhost:3000/rails/mailers/institution
class InstitutionMailerPreview < ActionMailer::Preview
    def welcome_email
        InstitutionMailer.with(user: User.first).welcome_email
    end
    
    def profile_update_email(user)
        InstitutionMailer.with(user: User.first).profile_update_email
    end

    def account_destroy_email(user)
        InstitutionMailer.with(user: User.first).account_destroy_email
    end
end
