class EventsController < ApplicationController
  def index
    @events = Event.all 

  end

  def new
    @new_event = Event.new
  end

  def create
    @new_event = Event.new(params_for_event)
    @new_event.save
    redirect_to events_path
  end

  def edit
    @edit_event = Event.find(params[:id])
    @edit_event.update_attributes(params_for_event)
    redirect_to events_path
  end

  def update
    @edit_event = Event.find(params[:id])
    @edit_event.update_attributes(params_for_event)
    redirect_to event_path
  end

  def destroy
    @delete_event = Event.find(params[:id])
    @delete_event.delete 
    redirect_to events_path
  end

  private

  def params_for_event
    params.require(:event).require(:name, :description, :date)
  end
end
