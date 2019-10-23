class MessagesController < ApplicationController
  before_action :set_conversation

  def create
    skip_authorization
    receipt = current_user.reply_to_conversation(@conversation, params[:body])
    if receipt != nil
      redirect_to conversation_path(receipt.conversation)
    else
      flash[:alert] = "Veuillez remplir tous les champs"
    end
  end

  private

  def set_conversation
    @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
  end
end
