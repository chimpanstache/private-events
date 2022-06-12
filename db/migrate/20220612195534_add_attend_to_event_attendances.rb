class AddAttendToEventAttendances < ActiveRecord::Migration[7.0]
  def change
    add_column :event_attendances, :will_attend, :boolean
  end
end
