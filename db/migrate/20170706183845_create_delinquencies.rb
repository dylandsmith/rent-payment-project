class CreateDelinquencies < ActiveRecord::Migration[5.0]
  def change
    create_table :delinquencies do |t|
      t.integer :amount
      t.integer :unit_id

      t.timestamps
    end
  end
end
