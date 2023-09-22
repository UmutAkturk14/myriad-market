class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    chat = Chat.find(message_params[:chat_id])
    authorize @message
    if @message.save
      response_html = render_to_string(
        partial: "messages/message",
        locals: { message: @message }
      )
      ChatChannel.broadcast_to(chat, message: response_html, sender_id: @message.user.id)
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
