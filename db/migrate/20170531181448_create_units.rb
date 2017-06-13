class CreateUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :units do |t|
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :address2
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
