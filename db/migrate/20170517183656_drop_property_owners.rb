class DropPropertyOwners < ActiveRecord::Migration[5.0]
  def change
      drop_table :property_owners
  end
end
