class MessagesController < ApplicationController
  api! 'List of messages for an event'
  formats [:json]
  param :event_id, Integer, 'Unique identifier for the event model that determines which messages will be shown.', required: true
  def index
    @messages = Messages.where(event_id: params[:event_id])
    render :index
  end

  api! 'Show a message'
  formats [:json]
  param :id, Integer, 'Unique identifier for the message model that determines which message will be shown.', required: true
  def show
    @message = Message.find(params[:id])
    render :show
  end

  api! 'Create a message'
  formats [:json]
  param :event_id, Integer, 'Unique identifier for the event model that determines which event the message will belong to.', required: true
  param :body, String, 'The message body.', required: true
  def create
    @message = Message.new(params)
    @message.sender = current_user

    if @message.save
      render :show
    end
  end

  api! 'Destroy a message'
  formats [:json]
  param :id, Integer, 'Unique identifier for the message model that determines which message will be destroyed.', required: true
  param :event_id, Integer, 'Unique identifier for the event model that determines which message will be destroyed.', required: true
  def destroy
    @event = Event.find(params[:id])

    if @event.destroy
      render :show
    end
  end
end