class ConversationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.conversation_mailer.create_conversation.subject
  #
  def create_conversation
    @conversation = params[:conversation]
    @sender = User.find(@conversation.message.sender_id)
    @recipient = @conversation.message.recipients.select{ |r| r.id != @sender.id}[0]

    mail(
      to:       @recipient.email,
      subject:  "#{@sender.prénom.capitalize} vous a envoyé un nouveau message"
    )
  end
end
