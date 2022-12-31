class InstitutionMailer < ApplicationMailer
    # before_action :set_institution

    def welcome_email(institution)
        @filepath = "#{RAILS_ROOT_PATH}/downloads/pdf/"
        @institution = institution
        return false if @institution.email.blank? &&  @institution.name.blank?

        if FileTest.exist?("#{@filepath}#{@institution.name}.pdf")
            attachments["File.pdf"] = File.read("#{@filepath}#{@institution.name}.pdf")
            build(@institution, "Welcome to My Awesome Site")
        else
            Reports::Pdf::Institution.new(@institution).write_pdf
            InstitutionMailer.welcome_email(institution)
        end
    end

    def profile_update_email(institution)
        build(institution, "Profile Update")
    end

    def account_destroy_email(institution)
        build(institution, "Account Deletion")
    end

    private

    def set_institution
        @institution = params[:institution]
    end

    def build(institution, subject)
        @institution = ActiveDecorator::Decorator.instance.decorate(institution)
        return false if institution.email.blank? && institution.name.blank?

        mail(to: "#{@institution.email_address} <#{@institution.institution_name}>", subject: subject)
    end
end