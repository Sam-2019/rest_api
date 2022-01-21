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
  end

  def delete
  end

  def cretae
  end
end
