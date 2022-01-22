class UserController < ApplicationController
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
    user.update(user_params)
  end

  def destroy
    user = User.find params[:id]
    user.destroy
  end

  def create
    user = User.new(user_params)
    if user.save
        render json: user.to_json
    else
        render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email)
  end

end
