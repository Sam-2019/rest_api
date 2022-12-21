class UserMailer < ApplicationMailer
    @filepath = "#{RAILS_ROOT_PATH}/downloads/pdf/"

    def welcome_email(user)
        @user = ActiveDecorator::Decorator.instance.decorate(user)
        return false if @user.email_address.blank? && @user.name.blank? 

        if FileTest.exist?("#{@filepath}#{@user.name}.pdf")
            attachments["File.pdf"] = File.read("#{@filepath}#{@user.name}.pdf")
            build(user, "Welcome to My Awesome Site")
        else
            InfoPdf::User.new(@user)
            UserMailer.welcome_email(user).deliver_later(wait: 15.seconds)
        end
    end

    def profile_update_email(user)
        build(user, "Profile Update")
    end

    def account_destroy_email(user)
        build(user, "Account Deletion")
    end

    private

    def build(user, subject)
        @user = ActiveDecorator::Decorator.instance.decorate(user)
        return false if @user.email_address.blank? && @user.name.blank? 

        mail(to: "#{@user.name} <#{@user.email_address}>", subject: subject)
    end
end