class DropPropertyOwner < ActiveRecord::Migration[5.0]
   def up
      drop_table :property_owners
   end

   def down
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
