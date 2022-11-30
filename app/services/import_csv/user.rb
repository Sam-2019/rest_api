module ImportCsv
  class User
    include CSVImporter

    model User

    column :first_name
    column :last_name
    column :email

    when_invalid :abort
  end
end