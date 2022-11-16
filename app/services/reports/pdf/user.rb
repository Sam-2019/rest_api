module Reports
  module Pdf
    class User < Reports::Pdf::Base

      def intro
        @user = ActiveDecorator::Decorator.instance.decorate(@data)
        @filepath = "#{PDF_DOWNLOAD_FOLDER}/#{@user.name}.pdf"
      end

      def write_pdf
        intro

        @document.move_down(5)
        @document.text "Hello #{@user.name}"
        @document.render_file @filepath
      end
    end
  end
end