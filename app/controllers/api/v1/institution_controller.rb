# frozen_string_literal: true

class Api::V1::InstitutionController < ApiController
  include PdfParam

  def index
    institutions = Institution.all
    render json: institutions.to_json
  end

  def pdf
    institution = Institution.find params[:id]
    Reports::Pdf::Institution.new(institution).generate

    respond_to do |format|
      format.json { render json: "Success", status: :created }
      format.pdf {
        send_file RAILS_ROOT_PATH.join("downloads/pdf", "#{institution.name.downcase}.pdf"),
          filename: "#{institution.name.downcase}.pdf", type: "application/pdf", disposition: "inline", x_sendfile: true
      }
    end
  end

  def spreadsheet
    report = Reports::Excel::InstitutionList.new.generate

    if report
      render json: "Success", status: :created
    else
      render json: false, status: :unprocessable_entity
    end
  end

  def show
    institution = Institution.find params[:id]

    if institution
      render json: institution.to_json
    else
      render_error(institution)
    end
  end

  def update
    institution = Institution.find params[:id]
    update = institution.update(institution_params)

    if update
      Dispatch.new(update).institution_update_mail
      render json: true, status: :created
    else
      render json: false, status: :unprocessable_entity
    end
  end

  def destroy
    institution = Institution.find params[:id]
    update = institution.update(soft_delete: true)

    if update
      Dispatch.new(update).institution_deletion_mail
      render json: true, status: :no_content
    else
      render_error(institution)
    end
  end

  def create
    institution = Institution.new(institution_params)

    if institution.save
      Dispatch.new(update).institution_creation_mail
      render json: institution.to_json, status: :created
    else
      render_error(institution)
    end
  end

  private

  def institution_params
    params.permit(:name, :location, :email)
  end

  def render_error(data)
    render json: data.errors.full_messages.to_sentence, status: :unprocessable_entity
  end
end
