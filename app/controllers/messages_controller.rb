class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    chat = Chat.find(message_params[:chat_id])
    authorize @message
    if @message.save
      ChatChannel.broadcast_to(chat, "New message")
      redirect_to chat_path(chat)
    else
      render "chats/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chat_id)
  end
end
