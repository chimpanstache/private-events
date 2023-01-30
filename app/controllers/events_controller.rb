class EventsController < ApplicationController
  def index
    @all_events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    current_user.create_event(event_params)
    redirect_to show_user_path(current_user.id)
  end

  private

  def event_params
    params.require(:event).permit(:title, :time)
  end
end

