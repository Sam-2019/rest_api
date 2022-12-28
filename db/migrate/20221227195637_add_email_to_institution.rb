class AddEmailToInstitution < ActiveRecord::Migration[7.0]
  def change
    add_column :institutions, :email, :string
  end
end
