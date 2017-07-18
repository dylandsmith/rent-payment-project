class CreateMaintanenceServices < ActiveRecord::Migration[5.0]
  def change
    create_table :maintanence_services do |t|
      t.string :location
      t.string :type
      t.string :desc
      t.datetime :time
      t.boolean :emergency

      t.timestamps
    end
  end
end
