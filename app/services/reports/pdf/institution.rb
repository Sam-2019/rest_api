# frozen_string_literal: true

module Reports
  module Pdf
    class Institution < Reports::Pdf::Base
      def intro
        @institution = @data
        @filepath = "#{PDF_DOWNLOAD_FOLDER}/#{@institution.name}.pdf"
      end

      def write_pdf
        intro

        @document.move_down(5)
        @document.font "Montserrat"
        @document.text "Hello #{@institution.name}", align: :left
        canvas

        @document.start_new_page
        bounding
        @document.move_down(5)
        @document.font "Courier"
        @document.text "See. We've left the previous page behind.", align: :right
        @document.move_down(5)
        @document.font "Courier"
        @document.text "Yeah.", align: :right

        @document.render_file @filepath
        true
      end
    end
  end
end
