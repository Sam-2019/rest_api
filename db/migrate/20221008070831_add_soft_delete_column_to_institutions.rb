class AddSoftDeleteColumnToInstitutions < ActiveRecord::Migration[7.0]
  def change
    add_column :institutions, :soft_delete, :boolean, default: 0
  end
end
