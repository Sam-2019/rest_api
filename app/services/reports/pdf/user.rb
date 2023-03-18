# frozen_string_literal: true

module Reports
  module Pdf
    class User < Reports::Pdf::Base
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
        @document.text "Hello #{@data.name}"
        @document.render_file @file
        true
      end
    end
  end
end
