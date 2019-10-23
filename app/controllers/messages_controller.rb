class MessagesController < ApplicationController
  before_action :set_conversation

  def create
    skip_authorization
    receipt = current_user.reply_to_conversation(@conversation, params[:body])
    redirect_to conversation_path(receipt.conversation)
  end

  private

  def set_conversation
    @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
  end
end

# message model
#<Mailboxer::Message:0x00007fe0cea1b038
# id: 83,
# type: "Mailboxer::Message",
# body: "ca ne marche pas en prod!!!!!!!!!!",
# subject: "test",
# sender_type: "User",
# sender_id: 22,
# conversation_id: 28,
# draft: false,
# notification_code: nil,
# notified_object_type: nil,
# notified_object_id: nil,
# attachment: nil,
# updated_at: Wed, 23 Oct 2019 13:36:51 UTC +00:00,
# created_at: Wed, 23 Oct 2019 13:36:51 UTC +00:00,
# global: false,
# expires: nil>,

# Conversation
#  id: 28,
#  subject: "test",
#  created_at: Wed, 23 Oct 2019 13:36:22 UTC +00:00,
#  updated_at: Wed, 23 Oct 2019 13:51:20 UTC +00:00>
