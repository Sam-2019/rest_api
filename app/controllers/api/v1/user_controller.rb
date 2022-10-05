class Api::V1::UserController < ApiController
  def index
    users = User.all
      render json: users.to_json
  end

  def show
    user = User.find params[:id]
    if user
      render json: user.to_json
    else
      render_error(user)
    end
  end

  def update
    user = User.find params[:id]
    updated_user = user.update(user_params)
      if updated_user
        UserMailer.profile_update_email(user).deliver_later
        render json: true, status: :created
      else
        render json: true, status: :unprocessable_entity
      end
  end

  def destroy
    user = User.find params[:id]
      if user.destroy
        UserMailer.account_destroy_email(user).deliver_later
        render json: true, status: :no_content
      else
        render_error(user)
      end
  end

  def create
    user = User.new(user_params)
      if user.save
        UserMailer.welcome_email(user).deliver_later
        render json: user.to_json, status: :created
      else
        render_error(user)
      end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :institution_id)
  end

  def render_error(data)
    render json: data.errors.full_messages.to_sentence, status: :unprocessable_entity
  end
end
