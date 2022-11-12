class Api::V1::InstitutionController < ApiController
  def index
    institutions = Institution.all
        render json: institutions.to_json
  end

  def download
    download_list = Reports::InstitutionReportBase.new.sample_data

    if download_list
      render json: "Success", status: :created
    else
      render json: "Failed", status: :unprocessable_entity
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
    updated_institution = institution.update(institution_params)
      if updated_institution
        InstitutionMailer.profile_update_email(institution).deliver_later
        render json: true, status: :created
      else
        render json: false, status: :unprocessable_entity
      end
  end

  def destroy
    institution = Institution.find params[:id]
    updated_institution = institution.update(soft_delete: true)
      if updated_institution
        InstitutionMailer.account_destroy_email(institution).deliver_later
        render json: true,  status: :no_content
      else
        render_error(institution)
      end
  end

  def create
    institution = Institution.new(institution_params)
      if institution.save
        InfoPdf::Institution.new(institution)
        InstitutionMailer.welcome_email(institution).deliver_later
        render json: institution.to_json, status: :created
      else
        render_error(institution)
      end
  end

  private

  def institution_params
    params.permit(:name, :location)
  end

  def render_error(data)
    render json: data.errors.full_messages.to_sentence, status: :unprocessable_entity
  end

end
