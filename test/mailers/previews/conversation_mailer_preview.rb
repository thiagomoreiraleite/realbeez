# Preview all emails at http://localhost:3000/rails/mailers/conversation_mailer
class ConversationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/conversation_mailer/create_conversation
  def create_conversation
    ConversationMailer.create_conversation
  end

end
