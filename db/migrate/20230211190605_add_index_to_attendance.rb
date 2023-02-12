class AddIndexToAttendance < ActiveRecord::Migration[7.0]
  def change
    add_column :attendances, :id, :primary_key
  end
end
