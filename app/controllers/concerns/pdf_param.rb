module PdfParam
    extend ActiveSupport::Concern

    private
    def pdf_param
        params.permit(:id)
    end
end