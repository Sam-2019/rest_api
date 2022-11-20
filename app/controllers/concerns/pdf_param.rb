module PdfParam
    extend ActiveSupport::Concern

    private
    def pdf_param
        params.require(:id)
    end
end