class RemoveUtilizesTypeFromProperties < ActiveRecord::Migration[5.0]
  def change
    remove_column :properties, :utilizes_type, :string
  end
end
