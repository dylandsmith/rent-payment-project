class CreatePropertyOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :property_owners do |t|
      t.string :first_name
      t.string :last_name
      t.string :owner_address
      t.string :owner_phone
      t.integer :number_of_properties

      t.timestamps
    end
  end
end
