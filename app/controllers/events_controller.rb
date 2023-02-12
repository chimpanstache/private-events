class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.create(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
    @host = @event.creator
  end

  private

  def event_params
    params.require(:event).permit(:title, :time)
  end
end

