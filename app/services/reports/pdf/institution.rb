# frozen_string_literal: true

module Reports
  module Pdf
    class Institution < Reports::Pdf::Base
      def generate
        @file = "#{PDF_DOWNLOAD_FOLDER}#{@data.name.downcase}.pdf"

        unless FileTest.exist?(@file.to_s)
          write_pdf
        end
      end

      def write_pdf
        @document.move_down(5)
        @document.font "Montserrat"
        @document.text "Hello #{@data.name}", align: :left
        @document.render_file @file
        true
      end
    end
  end
end
