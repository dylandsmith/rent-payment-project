class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :title
#      t.integer :utilizing_property_id
#      t.string :utilizing_property_type
      t.references :utilizes, polymorphic: true, index: true

      t.timestamps
    end
    add_index :properties, :utilizing_property_id
  end
end
