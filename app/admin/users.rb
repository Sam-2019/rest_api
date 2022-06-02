ActiveAdmin.register User, as: "People" do
  menu priority: 2, label: proc { I18n.t("active_admin.users") }
  permit_params :first_name, :last_name, :email, :institution_id
  actions :all, except: [:update, :destroy]

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :first_name, :last_name, :email, :state, :institution_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :email, :state, :institution_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
