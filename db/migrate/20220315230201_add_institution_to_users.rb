class AddInstitutionToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :institution
  end
end
