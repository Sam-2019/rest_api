# frozen_string_literal: true

class Api::V1::UserController < ApiController
  include PdfParam

  def index
    users = User.active
    render json: users.to_json
  end

  def pdf
    user = User.find params[:id]
    @user = ActiveDecorator::Decorator.instance.decorate(user)
    Reports::Pdf::User.new(@user).generate

    respond_to do |format|
        format.json { render json: "Success", status: :created }
        format.pdf {
          send_file RAILS_ROOT_PATH.join("downloads/pdf", "#{@user.name}.pdf"),
            filename: "#{@user.name}.pdf", type: "application/pdf", disposition: "inline", x_sendfile: true
        }
    end
  end

  def spreadsheet
    Reports::Excel::UserList.new.generate
      render json: "Success", status: :created
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
      Dispatch.new(user).user_update_mail
      render json: true, status: :created
    else
      render json: true, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find params[:id]
    updated_user = user.update(soft_delete: true)

    if updated_user
      Dispatch.new(user).user_deletion_mail
      render json: true, status: :no_content
    else
      render_error(user)
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      Dispatch.new(user).user_creation_mail
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
