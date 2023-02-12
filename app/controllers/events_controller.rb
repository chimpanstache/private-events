class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @all_events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    event_infos = event_params.merge({creator_id: current_user.id})
    @event = Event.new(event_infos)

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

