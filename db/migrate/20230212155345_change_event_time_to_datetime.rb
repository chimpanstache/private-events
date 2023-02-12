class ChangeEventTimeToDatetime < ActiveRecord::Migration[7.0]
  def up
    # add a temporary column
    add_column :events, :time_datetime, :datetime
    
    # add the the current start_time as datetime to the temporary column for each entry
    Event.all.each do |event|
      event.update(time_datetime: event.time.to_datetime) unless event.time.nil?
    end

    # drop the old time column
    remove_column :events, :time
    
    # rename the temporary column to start_time   
    rename_column :events, :time_datetime, :time
  end

  def down
    add_column :events, :time_time, :time
    
    Event.all.each do |event|
      event.update(time_time: event.time.to_time)
    end

    remove_column :events, :time
    rename_column :events, :time_time, :time
  end
end
