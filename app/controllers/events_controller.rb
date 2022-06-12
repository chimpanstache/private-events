class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    puts "############################"
    puts "############################"
    puts "############################"
    puts "############################"
    puts "############################"
    puts "############################"
    puts "############################"
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
      redirect_to :show
    else
      render :new, status: :unprocessable_entity
    end
  end


  private 

  def event_params
    params.require(:event).permit(:title, :date)
  end 
end
