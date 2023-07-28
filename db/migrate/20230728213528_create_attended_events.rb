class CreateAttendedEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :attended_events do |t|
      t.references :user
      t.references :event
      t.timestamps
    end
  end
end
