class UserMailer < ApplicationMailer
    # before_action :set_user
    @filepath = "#{RAILS_ROOT_PATH}/downloads/pdf/"

    def welcome_email(user)
        @user = ActiveDecorator::Decorator.instance.decorate(user)
        return false if @user.email_address.blank? && @user.user_name.blank? 

        if FileTest.exist?("#{@filepath}#{@user.user_name}.pdf")
            attachments["File.pdf"] = File.read("#{@filepath}#{@user.user_name}.pdf")
            build(user, "Welcome to My Awesome Site")
        else
            Reports::Pdf::User.new(@user)
            UserMailer.welcome_email(user).deliver_later
        end
    end

    def profile_update_email(user)
        build(user, "Profile Update")
    end

    def account_destroy_email(user)
        build(user, "Account Deletion")
    end

    private

    def set_user
        @user = params[:user]
    end

    def build(user, subject)
        @user = ActiveDecorator::Decorator.instance.decorate(user)
        return false if @user.email_address.blank? && @user.user_name.blank? 

        mail(to: "#{@user.user_name} <#{@user.email_address}>", subject: subject)
    end
end