class Api::V1::UserController < ApplicationController
  def index
    users = User.all
        render json: users.to_json
  end

  def show
    user = User.find params[:id]
        render json: user.to_json
  end

  def update
    user = User.find params[:id]
    updated_user = user.update(user_params)
      if updated_user
        render json: true, status: :created
      else
        render json: , status: :unprocessable_entity
      end
  end

  def destroy
    user = User.find params[:id]
      if user.destroy
          render json:true, :status: :no_content
      else
          render json: user.errors, status: :unprocessable_entity
      end
  end

  def create
    user = User.new(user_params)
      if user.save
          render json: user.to_json, status: :created
      else
          render json: user.errors, status: :unprocessable_entity
      end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :institutions_id)
  end

end
