class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = ActiveDecorator::Decorator.instance.decorate(user) 
        mail(to: "#{@user.name} <#{@user.email}>", subject: 'Welcome to My Awesome Site')
    end

    def profile_update_email(user)
        @user = ActiveDecorator::Decorator.instance.decorate(user) 
        mail(to: "#{@user.name} <#{@user.email}>", subject: 'Profile Update')
    end

    def account_destroy_email(user)
        @user = ActiveDecorator::Decorator.instance.decorate(user) 
        mail(to: "#{@user.name} <#{@user.email}>", subject: 'Account Deletion')
    end
end