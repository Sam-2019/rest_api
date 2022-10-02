class UserMailer < ApplicationMailer

    @filepath = InfoPdf::PDF_DOWNLOAD_FOLDER

    def welcome_email(user)
        @user = ActiveDecorator::Decorator.instance.decorate(user)
        return false if @user.email.blank? && @user.name.blank? 

        if FileTest.exist?("#{@filepath}#{@user.name}.pdf")
            attachments["File.pdf"] = File.read("#{@filepath}#{@user.name}.pdf")
            mail(to: "#{@user.name} <#{@user.email}>", subject: 'Welcome to My Awesome Site')
        else
            InfoPdf::User.new(@user.name)
            UserMailer.welcome_email(@user.name).deliver_later(wait: 15.seconds)
        end
    end

    def profile_update_email(user)
        @user = ActiveDecorator::Decorator.instance.decorate(user)
        return false if @user.email.blank? && @user.name.blank?

        mail(to: "#{@user.name} <#{@user.email}>", subject: 'Profile Update')
    end

    def account_destroy_email(user)
        @user = ActiveDecorator::Decorator.instance.decorate(user)
        return false if @user.email.blank? && @user.name.blank?

        mail(to: "#{@user.name} <#{@user.email}>", subject: 'Account Deletion')
    end
end