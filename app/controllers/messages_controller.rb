class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    chat = Chat.find(message_params[:chat_id])
    authorize @message
    if @message.save
      flash[:notice] = "Your message has been sent"
      redirect_to chat_path(chat)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chat_id)
  end
end
