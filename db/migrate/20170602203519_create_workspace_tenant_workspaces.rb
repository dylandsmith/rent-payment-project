class CreateWorkspaceTenantWorkspaces < ActiveRecord::Migration[5.0]
  def change
    create_table :workspace_tenant_workspaces do |t|

      t.timestamps
    end
  end
end
