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
  end

  def delete
  end

  def cretae
  end
end
