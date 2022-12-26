# Preview all emails at http://localhost:3000/rails/mailers/user
class UserMailerPreview < ActionMailer::Preview
    def welcome_email
        UserMailer.with(user: User.first).welcome_email
    end
      
    def profile_update_email(user)
        UserMailer.with(user: User.first).profile_update_email
    end

    def account_destroy_email(user)
        UserMailer.with(user: User.first).account_destroy_email
    end
end
