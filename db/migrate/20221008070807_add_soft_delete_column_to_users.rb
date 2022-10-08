class AddSoftDeleteColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :soft_delete, :boolean, default: 0
  end
end
