class RemoveUtilizesIdFromProperties < ActiveRecord::Migration[5.0]
  def change
    remove_column :properties, :utilizes_id, :integer
  end
end
