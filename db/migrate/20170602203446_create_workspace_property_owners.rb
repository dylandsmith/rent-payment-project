class CreateWorkspacePropertyOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :workspace_property_owners do |t|

      t.timestamps
    end
  end
end
