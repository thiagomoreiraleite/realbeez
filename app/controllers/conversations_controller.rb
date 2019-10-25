class ConversationsController < ApplicationController

  def index
    skip_policy_scope
    @conversations_mailbox = current_user.mailbox.conversations
    @conversations_unread = current_user.unread_inbox_count
    # all receipts from the mailbox
    @receipts = []
    @conversations_mailbox.each do |conversation|
      conversation.receipts_for(current_user).each do |receipt|
        @receipts << receipt
      end
    end
    # all unread receipts
    @receipts_unread = @receipts.select { |receipt| receipt.is_read? == false}
    # all unread conversations with duplicated id
    @conversations_unread_all = @receipts_unread.map { |receipt| receipt.conversation}
    # all unread conversation with unique id
    @conversations_unread_uniq_id = @conversations_unread_all.uniq {|conversation| conversation.id}
  end

  def show
    skip_authorization
    @conversation = current_user.mailbox.conversations.find(params[:id])
    @messages = @conversation.receipts.map { |receipt| receipt.message}
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
    redirect_to conversation_path(receipt.conversation)
  end

  def destroy
    skip_authorization
    @conversation = current_user.mailbox.conversations.find(params[:id])
    @conversation.destroy
    redirect_to conversations_path
  end
end
