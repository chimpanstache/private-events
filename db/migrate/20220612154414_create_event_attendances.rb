class CreateEventAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :event_attendances do |t|
      t.timestamps
      t.integer :attendee_id
      t.integer :attended_event_id
    end
  end
end
