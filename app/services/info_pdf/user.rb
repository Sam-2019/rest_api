require "prawn"
require "securerandom"

module InfoPdf
  class User
    PDF_DOWNLOAD_FOLDER = "#{RAILS_ROOT_PATH}/pdf_downloads/"

    def initialize(user)
      @user = user
      @filepath = "#{PDF_DOWNLOAD_FOLDER}/#{@user}.pdf"
      get_pdf
    end
  
    def get_pdf
        unless FileTest.exist?(@filepath)
          write_pdf
      end
   end
  
    def write_pdf
      info = {
        Title: "#{@user}.pdf",
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

      timestamp = Time.current

      @document.bounding_box [@document.bounds.left, @document.bounds.top], width: @document.bounds.width do
        @document.stroke_color "cbcdd1"
        @document.stroke_horizontal_rule
        @document.move_down(5)
        @document.font "Courier"
        @document.text "#{timestamp.strftime("%A, %d %b %Y at %-I:M %p")} / #{SecureRandom.hex}", size: 7, character_spacing:1, color:"999999"
      end

      @document.move_down(5)
      @document.text "Hello #{@user}"
      @document.render_file @filepath
    end
  end
end