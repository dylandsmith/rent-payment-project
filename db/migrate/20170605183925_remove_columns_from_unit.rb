class RemoveColumnsFromUnit < ActiveRecord::Migration[5.0]
  def change
    remove_column :units, :address, :string
    remove_column :units, :city, :string
    remove_column :units, :state, :string
    remove_column :units, :zip, :string
  end
end
