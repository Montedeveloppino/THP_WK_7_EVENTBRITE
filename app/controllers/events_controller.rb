class EventsController < ApplicationController
  def index
  @event = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    @event.save
  redirect_to events_path
  end

  def edit
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
    def comment_params
      params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
    end
end
