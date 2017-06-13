class AddColumnsToUnit < ActiveRecord::Migration[5.0]
  def change
    add_column :units, :rental_fee, :float
    add_column :units, :sq_ft, :integer
    add_column :units, :bdrms, :int
    add_column :units, :baths, :int
    add_column :units, :fl_lvl, :int
    add_column :units, :garage_strg, :boolean
  end
end
