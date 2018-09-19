class AddPasswordConfirmationAndAdmintoUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_confirmation, :string
    add_column :users, :admin, :string
  end
end
