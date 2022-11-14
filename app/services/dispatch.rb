class Dispatch
        def initialize(data)
            @data = data
        end

        def send_user_mail
            UserMailer.welcome_email(@data).deliver_later
        end

        def send_institution_mail
            InstitutionMailer.welcome_email(@data).deliver_later
        end
end