class InstitutionController < ApplicationController
  def index
  institutions = Institution.all
  end

  def show
  institution = Institution.find params[:id]
  end

  def update
  end

  def delete
  end
end
