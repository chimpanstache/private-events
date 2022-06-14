class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
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
    @attendance = current_user.event_attendance.build(attendee_id: current_user.id, attended_event_id: params[:id])
    if @attendance.save
      redirect_to events_path
    else
      redirect_to root_path
    end
  end 

  private
  
  def event_params
    params.require(:event).permit(:title, :date)
  end 
end
