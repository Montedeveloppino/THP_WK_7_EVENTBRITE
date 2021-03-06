class EventsController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_event, only: %i[ show edit update destroy ]
  def index
  @event = Event.all
  end

  def new
    @event = Event.new
  end

  def create
  @event = Event.new(event_params)
    if user_signed_in? == false
      redirect_to root_path, warning: "you must be registered and login to create an event!"
    end
    
    if @event.save == true
      redirect_to root_path, notice: "The event has been created"
    else
      redirect_to new_event_path, alert: "All fields are mandatory"
    end
    
  end

  def edit
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if user_signed_in? == false || (current_user.id < @event.user_id || current_user.id > @event.user_id)
      redirect_to root_path, message: "you must be registered and login to create an event!" 
    else 
      @event.update(event_params)
      redirect_to events_path
    end 
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private
    def event_params
      params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location).merge(user_id: current_user.id)
    end
    
    def set_event
      @event = Event.find(params[:id])
    end
end
