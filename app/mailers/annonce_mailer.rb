class AnnonceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.annonce_mailer.checkout_agent_notify_admin.subject
  #
  def checkout_agent_notify_admin
    @annonce = params[:annonce]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    @agent = User.find(@annonce.agent_user_id)
    mail(
      to:       @admin.email,
      subject:  "#{@agent.prénom.capitalize} a loué un bien"
    )
  end

  def checkout_agent_notify_proprio
    @annonce = params[:annonce]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    @agent = User.find(@annonce.agent_user_id)
    mail(
      to:       @annonce.user.email,
      subject:  "#{@agent.prénom.capitalize} a loué votre bien"
    )
  end

  def checkout_proprio_notify_admin
    @annonce = params[:annonce]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    @agent = User.find(@annonce.agent_user_id)
    mail(
      to:       @admin.email,
      subject:  "#{@annonce.user.prénom.capitalize} confirme la location de son bien"
    )
  end

  def checkout_proprio_notify_agent
    @annonce = params[:annonce]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    @agent = User.find(@annonce.agent_user_id)
    mail(
      to:       @agent.email,
      subject:  "#{@annonce.user.prénom.capitalize} confirme la location de son bien"
    )
  end

  def create_new_annonce
    @annonce = params[:annonce]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    mail(
      to:       @admin.email,
      subject:  "#{@annonce.user.prénom.capitalize} vient de publier une annonce"
    )
  end
end
