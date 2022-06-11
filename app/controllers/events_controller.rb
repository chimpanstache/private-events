class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.event.build(event_params)

    if @event.save
      render user_show_path
    else
      render :new, notice
    end
  end

  private 

  def event_params
    params(:events).require(:title, :date)
  end 
end
