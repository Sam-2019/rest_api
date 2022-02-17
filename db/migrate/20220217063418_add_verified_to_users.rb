class AddVerifiedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :verified, :integer
  end
end
