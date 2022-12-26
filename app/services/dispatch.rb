class Dispatch
        def initialize(data)
            @data = data
        end

        def user_creation_mail
            UserMailer.welcome_email(@data).deliver_later
        end

        def institution_creation_mail
            InstitutionMailer.welcome_email(@data).deliver_later
        end
end