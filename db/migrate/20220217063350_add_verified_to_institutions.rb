class AddVerifiedToInstitutions < ActiveRecord::Migration[7.0]
  def change
    add_column :institutions, :verified, :integer
  end
end
