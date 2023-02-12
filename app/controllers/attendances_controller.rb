class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def new
    attendance = Attendance.new
  end

  def create
    @event = Event.find(params[:event_id])
    attendance_infos = attendance_params.merge({user_id: current_user.id})
    @attendance = @event.attendances.create(attendance_infos)
    redirect_to event_path(@event)
  end

  private

  def attendance_params
    params.permit(:event_id)
  end
end
