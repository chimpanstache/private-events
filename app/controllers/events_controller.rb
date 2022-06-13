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
    @event = Event.find(id: id)
    @event.attendees << current_user
  end 

  private
  
  def event_params
    params.require(:event).permit(:title, :date)
  end 
end
