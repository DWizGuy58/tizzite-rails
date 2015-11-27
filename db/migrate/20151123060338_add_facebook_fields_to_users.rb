class AddFacebookFieldsToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :password_confirmation

    rename_column :users, :full_name, :name
    rename_column :users, :preferred_name, :first_name
    add_column :users, :last_name, :string
    add_column :users, :image, :string
    add_column :users, :location, :string
    add_column :users, :token, :string
    add_column :users, :expires_at, :datetime
  end
end
