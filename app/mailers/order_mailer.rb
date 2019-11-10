class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.checkout_proprio_notify_admin.subject
  #
  def checkout_proprio_notify_admin
    @order = params[:order]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    @agent = User.find(@order.annonce.agent_user_id)
    mail(
      to:       @admin.email,
      subject:  "#{@order.annonce.user.prénom.capitalize} confirme la location de son bien"
    )
  end

  def checkout_proprio_notify_agent
    @order = params[:order]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    @agent = User.find(@order.annonce.agent_user_id)
    mail(
      to:       @agent.email,
      subject:  "#{@order.annonce.user.prénom.capitalize} confirme la location de son bien"
    )
  end
end
