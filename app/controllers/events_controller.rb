class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def attend
    puts "#######################################################"
    puts "#######################################################"
    puts "#######################################################"
    puts "#######################################################"
    puts "#######################################################"
    puts "#######################################################"
    puts "#######################################################"
    puts "#######################################################"
    puts "#######################################################"
    puts "#######################################################"
    puts "#######################################################"
    @attendance = EventAttendance.create(attendance_params)
  end 

  private
  
  def attendance_params
    params.require(:event_attendance).permit(:attended_event_id, :attendee_id, :will_attend)
  end

  def event_params
    params.require(:event).permit(:title, :date)
  end 
end
