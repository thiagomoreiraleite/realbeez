class ConversationsController < ApplicationController

  def index
    skip_policy_scope
    @conversations_mailbox = current_user.mailbox.conversations
  end

  def show
    skip_authorization
    @conversation = current_user.mailbox.conversations.find(params[:id])
  end

  def new
    skip_authorization
    # @recipients = User.all - [current_user]
    @recipients = []
    # @conversation = params[:conversation_id]
    @recipients << @recipient = User.find(params[:message][:to].to_i)
  end

  def create
    skip_authorization
    recipient = User.find(params[:user_id])
    receipt = current_user.send_message(recipient, params[:body], params[:subject])
    # @conversation = params[:conversation_id]
    if receipt != nil
      redirect_to conversation_path(receipt.conversation)
    else
      flash[:alert] = "Veuillez remplir tous les champs"
    end
  end

  def destroy
    skip_authorization
    @conversation = current_user.mailbox.conversations.find(params[:id])
    @conversation.destroy
    redirect_to conversations_path
  end
end
