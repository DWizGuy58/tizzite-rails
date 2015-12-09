class EventsController < ApplicationController
  api! 'List of events'
  formats [:json]
  param :scope, [:all, :owned, :joined, :requested], 'Scope that will limit the returned events. Returns all events by default.'
  def index
    case params[:scope]
      when :owned
        @events = current_user.owned_events
      when :joined
        @events = current_user.joined_events
      when :requested
        @events = current_user.requested_events
      else
        @events = Events.all
    end

    render :index
  end

  api! 'Show an event'
  formats [:json]
  param :id, Integer, 'Unique identifier for the event model that determines which event will be shown.', required: true
  def show
    @event = Event.find(params[:id])
    render :show
  end

  api! 'Create an event'
  formats [:json]
  param :name, String, 'The name of the event.', required: true
  param :description, String, 'The description of the event.'
  param :lat, Float, 'The latitude of the event.', required: true
  param :lon, Float, 'The longitude of the event.', required: true
  def create
    @event = Event.new(params)
    @event.owner = current_user

    if @event.save
      render :show
    end
  end

  api! 'Update an event'
  formats [:json]
  param :id, Integer, 'Unique identifier for the event model that determines which event will be modified.', required: true
  param :name, String, 'The name of the event.', required: true
  param :description, String, 'The description of the event.'
  param :lat, Float, 'The latitude of the event.', required: true
  param :lon, Float, 'The longitude of the event.', required: true
  def update
    @event = Event.find(params[:id])
    @event.assign_attributes(params)

    if @event.save
      render :show
    end
  end

  api! 'Destroy an event'
  formats [:json]
  param :id, Integer, 'Unique identifier for the event model that determines which event will be destroyed.', required: true
  def destroy
    @event = Event.find(params[:id])

    if @event.destroy
      render :show
    end
  end
end