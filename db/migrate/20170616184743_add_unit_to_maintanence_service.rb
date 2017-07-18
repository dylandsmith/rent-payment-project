class AddUnitToMaintanenceService < ActiveRecord::Migration[5.0]
  def change
    add_reference :maintanence_services, :unit, foreign_key: true
  end
end
