class AgentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.agent_mailer.candidature_become_agent_RB.subject
  #
  def candidature_become_agent_RB
    @agent = params[:agent]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]

    mail(
      to:       @admin.email,
      subject:  "#{@agent.user.prénom.capitalize} a postulé pour devenir agent"
    )
  end

  def confirmation_become_agent_RB
    @agent = params[:agent]

    mail(
      to:       @agent.user.email,
      subject:  "Confirmation de la réception de votre candidature"
    )
  end

  def candidature_update_agent_RB
    @agent = params[:agent]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]

    mail(
      to:       @admin.email,
      subject:  "#{@agent.user.prénom.capitalize} a modifié son profil agent"
    )
  end

  # def candidature_accept_agent_RB
  #   @agent = params[:agent]
  #   @admin = User.where("email = ?", "contact@realbeez.com")[0]

  #   mail(
  #     to:       @agent.user.email,
  #     subject:  "#{@admin.prénom.capitalize} accepte votre candidature"
  #   )
  # end

  def candidature_decline_agent_RB
    @agent = params[:agent]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]

    mail(
      to:       @agent.user.email,
      subject:  "#{@admin.prénom.capitalize} rejète votre candidature"
    )
  end
end
