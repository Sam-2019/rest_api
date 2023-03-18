# frozen_string_literal: true

module Reports
  module Pdf
    class Institution < Reports::Pdf::Base
      def intro
        @file = "#{PDF_DOWNLOAD_FOLDER}/#{@data.name}.pdf"
      end

      def generate
        get_pdf
        true
      end

      def get_pdf
        intro

        unless FileTest.exist?("#{@file}")
          write_pdf
        end
      end

      def write_pdf
        @document.move_down(5)
        @document.font "Montserrat"
        @document.text "Hello #{@data.name}", align: :left
        canvas

        @document.start_new_page
        bounding
        @document.move_down(5)
        @document.font "Courier"
        @document.text "See. We've left the previous page behind.", align: :right
        @document.move_down(5)
        @document.font "Courier"
        @document.text "Yeah.", align: :right

        @document.render_file @file
        true
      end
    end
  end
end
