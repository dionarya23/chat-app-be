class Api::MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def index
    room = Room.find(params[:room_id])
    messages = room.messages.order(created_at: :asc).select(:user, :message)
    render json: { messages: messages.map { |msg| { user: msg.user, message: msg.message } } }
  end

  def create
    room = Room.find(params[:room_id])
    message = room.messages.new(message_params)

    if message.save
      Pusher.trigger("chat_room_#{params[:room_id]}", 'new_message', {
        user: message.user,
        message: message.message
      })

      render json: message, status: :created
    else
      render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:user, :message)
  end
end
