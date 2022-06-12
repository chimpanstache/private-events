class EventAttendancesController < ApplicationController
  before_action :authenticate_user!

  def new
    @attendance = EventAttendance.new
  end
  
  def create
    @attendance = current_user.event_attendance.build(attendance_params)

    if @attendance.save
      redirect_to :index
    else
      redirect_to events_path, status: :unprocessable_entity
    end
  end

  private

  def attendance_params
    params.require(:event_attendance).permit(:attended_event_id, :attendee_id, :will_attend)
  end
end
