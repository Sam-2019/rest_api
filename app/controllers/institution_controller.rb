class InstitutionController < ApplicationController
  def index
    institutions = Institution.all
        render json: institutions.to_json
  end

  def show
    institution = Institution.find params[:id]
        render json: institution.to_json
  end

  def update
    institution = Institution.find params[:id]
    institution.update(institution_params)
  end

  def destroy
    institution = Institution.find params[:id]
    institution.destroy
  end

  def create
    institution = Institution.new(institution_params)
    if institution.save
        render json: institution.to_json
    else
        render json: institution.errors, status: :unprocessable_entity
    end
  end

  private

  def institution_params
    params.permit(:name, :location)
  end

end
