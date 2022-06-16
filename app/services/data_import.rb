class DataImport
    include CSVImporter

    model Institution

    column :name
    column :location

    when_invalid :abort
  end