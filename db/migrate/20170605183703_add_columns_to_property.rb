class AddColumnsToProperty < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :st_add, :string
    add_column :properties, :city, :string
    add_column :properties, :state, :string
    add_column :properties, :zip, :string
  end
end
