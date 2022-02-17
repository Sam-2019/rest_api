class AddStateToInstitutions < ActiveRecord::Migration[7.0]
  def change
    add_column :institutions, :state, :string
  end
end
