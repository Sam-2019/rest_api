class AddApprovedToInstitutions < ActiveRecord::Migration[7.0]
  def change
    add_column :institutions, :approved, :integer
  end
end
