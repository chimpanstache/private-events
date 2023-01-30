class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @all_events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    event_params.merge!({creator_id: current_user.id})
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end  
  end

  private

  def event_params
    params.require(:event).permit(:title, :time)
  end
end

