class AttendancesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    attendance = Attendance.new
  end

  def create
    attendance_infos = attendance_params.merge({user_id: current_user.id})
    @attendance = Attendance.new(attendance_infos)

    if @attendance.save
      redirect_to event_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def attendance_params
    params.permit(:event_id)
  end
end
