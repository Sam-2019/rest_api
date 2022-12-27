class InstitutionMailer < ApplicationMailer
    # before_action :set_institution
    @filepath = "#{RAILS_ROOT_PATH}/downloads/pdf/"

    def welcome_email(institution)
        @institution = institution
        return false if  @institution.email.blank? &&  @institution.name.blank?

        if FileTest.exist?("#{@filepath}#{@institution.name}.pdf")
            attachments["File.pdf"] = File.read("#{@filepath}#{@institution.name}.pdf")
            build(@institution, "Welcome to My Awesome Site")
        else
            InfoPdf::Institution.new(@institution)
            InstitutionMailer.welcome_email(institution).deliver_later(wait: 15.seconds)
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
        return false if institution.email.blank? && institution.name.blank?

        mail(to: "#{institution.name} <#{institution.email}>", subject: subject)
    end
end