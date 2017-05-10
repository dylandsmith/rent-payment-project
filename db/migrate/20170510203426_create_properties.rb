class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :property_title
      t.string :address
      t.integer :number_of_units

      t.timestamps
    end
  end
end
