class CandidatureMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.candidature_mailer.candidature_create_proprio.subject
  #
  def candidature_create_proprio
    @candidature = params[:candidature]

    mail(
      to:       @candidature.user.email,
      subject:  "#{@candidature.annonce.user.prénom.capitalize} demande vos services"
    )
  end

  def candidature_create_agent
    @candidature = params[:candidature]

    mail(
      to:       @candidature.annonce.user.email,
      subject:  "#{@candidature.user.prénom.capitalize} propose ses services"
    )
  end

  def candidature_accept_proprio
    @candidature = params[:candidature]

    mail(
      to:       @candidature.user.email,
      subject:  "#{@candidature.annonce.user.prénom.capitalize} accepte vos services"
    )
  end

  def candidature_accept_agent
    @candidature = params[:candidature]

    mail(
      to:       @candidature.annonce.user.email,
      subject:  "#{@candidature.user.prénom.capitalize} accepte votre demande"
    )
  end

  def candidature_reject_proprio
    @candidature = params[:candidature]

    mail(
      to:       @candidature.user.email,
      subject:  "#{@candidature.annonce.user.prénom.capitalize} rejète vos services"
    )
  end

  def candidature_reject_agent
    @candidature = params[:candidature]

    mail(
      to:       @candidature.annonce.user.email,
      subject:  "#{@candidature.user.prénom.capitalize} rejète votre demande"
    )
  end

  def candidature_create_proprio_notify_admin
    @candidature = params[:candidature]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]

    mail(
      to:       @admin.email,
      subject:  "#{@candidature.annonce.user.prénom.capitalize} #{@candidature.annonce.user.nom.capitalize} demande les services de #{@candidature.user.prénom.capitalize} #{@candidature.user.nom.capitalize}"
    )
  end

  def candidature_create_agent_notify_admin
    @candidature = params[:candidature]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]

    mail(
      to:       @admin.email,
      subject:  "#{@candidature.user.prénom.capitalize} #{@candidature.user.nom.capitalize} propose ses services à #{@candidature.annonce.user.prénom.capitalize} #{@candidature.annonce.user.nom.capitalize}"
    )
  end
end
