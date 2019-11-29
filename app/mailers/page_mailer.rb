class PageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.page_mailer.contactez_nous.subject
  #
  def contactez_nous
    @conversation = params[:conversation]
    @email_sender = params[:conversation][:email]
    @email_subject = params[:conversation][:subject]
    @email_body = params[:conversation][:body]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    mail(
      to:       @admin.email,
      subject:  "#{@email_sender} vous a envoyé un message"
    )
  end
end
