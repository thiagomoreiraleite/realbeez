class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.reply_message.subject
  #
  def reply_message
    @message = params[:message]
    @sender = User.find(@message.message.sender_id)
    @recipient = @message.message.recipients.select{ |r| r.id != @sender.id}[0]

    mail(
      to:       @recipient.email,
      subject:  "#{@sender.prénom.capitalize} vous a envoyé un nouveau message"
    )
  end
end
