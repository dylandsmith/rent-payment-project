class RemoveUnitIdFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :unit_id, :integer
  end
end
