ActiveAdmin.register Institution do
  menu priority: 1, label: proc { I18n.t("active_admin.institutions") }
  permit_params :name, :location
  actions :all, except: [:update, :destroy]

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :location, :state
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :location, :state]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
