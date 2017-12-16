class RemoveNumOfPropertiesFromPropertyOwners < ActiveRecord::Migration[5.0]
  def change
      remove_column :property_owners, :num_of_properties, :integer
  end
end
