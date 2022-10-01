require "prawn"

module InfoPdf
  class Institution
    PDF_DOWNLOAD_FOLDER = "#{RAILS_ROOT_PATH}/pdf_downloads/"
  
    def initialize(institution)
      @institution = institution
      @filepath = "#{PDF_DOWNLOAD_FOLDER}/#{@institution}-name.pdf"
      get_pdf
    end
  
    def get_pdf
        unless FileTest.exist?(@filepath)
          write_pdf
      end
   end
  
    def write_pdf
      info = {
        Title: "#{@institution}-name.pdf",
        Author: 'Rest API',
        Subject: 'My Subject',
        Keywords: 'test metadata ruby pdf dry',
        Creator: 'Rest API App',
        Producer: 'Prawn',
        CreationDate: Time.now
       }
  
      @document = Prawn::Document.new(page_size: "A5", page_layout: :landscape, info: info)
      @document.text 'Hello World'
      @document.render_file @filepath
    end
  end
end
