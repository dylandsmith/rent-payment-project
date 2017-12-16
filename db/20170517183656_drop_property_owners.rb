class DropPropertyOwners < ActiveRecord::Migration[5.0]
  def change
      drop_table :properties_owners
  end
end
