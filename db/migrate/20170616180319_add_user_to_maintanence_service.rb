class AddUserToMaintanenceService < ActiveRecord::Migration[5.0]
  def change
    add_reference :maintanence_services, :user, foreign_key: true
  end
end
