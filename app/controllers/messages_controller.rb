class MessagesController < ApplicationController
  before_action :set_conversation

  def create
    skip_authorization
    receipt = current_user.reply_to_conversation(@conversation, params[:body])
    # Send messae
    mail = MessageMailer.with(message: receipt).reply_message
    mail.deliver_now
    redirect_to conversation_path(receipt.conversation)
  end

  private

  def set_conversation
    @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
  end
end
