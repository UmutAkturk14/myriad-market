class ChatsController < ApplicationController
  def show
    @chat = Chat.find(params[:id])
    @message = Message.new(user: current_user)
    authorize @chat
  end

  def index
    @chats = policy_scope(Chat)
  end

  def unsubscribe
    @chat = Chat.find(params[:id])
    authorize @chat

    # Remove the current user from the chat recipients
    @chat.recipients.delete(current_user)
    chat_id = @chat.id
    if @chat.recipients.size < 2
      @chat.destroy
      Message.where(chat_id: chat_id).destroy_all
    end

    flash[:notice] = "You have unsubscribed from the chat."
    redirect_to chats_path
  end


end
