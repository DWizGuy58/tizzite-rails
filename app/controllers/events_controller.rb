class EventsController < ApplicationController

  def create
    @event = Event.new params['event']
    if @event.save
      render :json => { } # send back any data if necessary
    else
      render :json => { }, :status => 500
    end
  end

end