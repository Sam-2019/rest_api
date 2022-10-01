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
      @document.font_families.update("Montserrat" => {
        :normal => RAILS_ROOT_PATH.join("app/assets/fonts/Montserrat/Montserrat-Regular.ttf"),
        :italic => RAILS_ROOT_PATH.join("app/assets/fonts/Montserrat/Montserrat-Italic.ttf"),
        :bold => RAILS_ROOT_PATH.join("app/assets/fonts/Montserrat/Montserrat-Bold.ttf"),
        :bold_italic => RAILS_ROOT_PATH.join("app/assets/fonts/Montserrat/Montserrat-BoldItalic.ttf"),
      })
      @document.text "Hello #{@institution}"
      @document.render_file @filepath
    end
  end
end
