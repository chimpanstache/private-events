class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def new
    @attendance = Attendance.new
  end

  def create
    @event = Event.find(params[:event_id])
    current_user.attendances.create(event_id: params[:event_id])
    redirect_to event_path(@event)
  end

  private

  def attendance_params
    params.permit(:event_id)
  end
end
