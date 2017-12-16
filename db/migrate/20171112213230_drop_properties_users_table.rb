class DropPropertiesUsersTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :properties_users
  end
end
