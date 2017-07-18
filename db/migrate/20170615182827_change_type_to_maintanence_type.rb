class ChangeTypeToMaintanenceType < ActiveRecord::Migration[5.0]
  def change
    rename_column :maintanence_services, :type, :maintanence_type
  end
end
