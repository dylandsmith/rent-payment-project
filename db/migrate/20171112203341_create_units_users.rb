class CreateUnitsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :units_users do |t|
      t.references :user, foreign_key: true
      t.references :unit, foreign_key: true
    end
  end
end
