class LocataireCandidatureMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.candidature_mailer.candidature_create_proprio.subject
  #
  def create_locataire_notify_agent
    @locataire_candidature = params[:locataire]
    mail(
      to:       User.find(@locataire_candidature.annonce.agent_user_id.to_i).email,
      subject:  "#{Locataire.find(@locataire_candidature.locataire_id).prenom.capitalize} #{Locataire.find(@locataire_candidature.locataire_id).nom.capitalize} a déposé un dossier de location"
    )
  end

  def create_locataire_notify_proprio
    @locataire_candidature = params[:locataire]
    mail(
      to:       @locataire_candidature.annonce.user.email,
      subject:  "#{Locataire.find(@locataire_candidature.locataire_id).prenom.capitalize} #{Locataire.find(@locataire_candidature.locataire_id).nom.capitalize} a déposé un dossier de location"
    )
  end

  def create_locataire_notify_admin
    @locataire_candidature = params[:locataire]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]

    mail(
      to:       @admin.email,
      subject:  "#{Locataire.find(@locataire_candidature.locataire_id).prenom.capitalize} #{Locataire.find(@locataire_candidature.locataire_id).nom.capitalize} a déposé un dossier de location"
    )
  end

  def accept_locataire_notify_agent
    @locataire_candidature = params[:locataire]
    mail(
      to:       User.find(@locataire_candidature.annonce.agent_user_id.to_i).email,
      subject:  "#{@locataire_candidature.annonce.user.prénom.capitalize} #{@locataire_candidature.annonce.user.nom.capitalize[0]}. accepte un dossier de location"
    )
  end

  def accept_locataire_notify_locataire
    @locataire_candidature = params[:locataire]
    mail(
      to:       Locataire.find(@locataire_candidature.locataire_id).email,
      subject:  "#{@locataire_candidature.annonce.user.prénom.capitalize} #{@locataire_candidature.annonce.user.nom.capitalize[0]}. accepte votre dossier de location"
    )
  end

  def accept_locataire_notify_admin
    @locataire_candidature = params[:locataire]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]

    mail(
      to:       @admin.email,
      subject:  "#{@locataire_candidature.annonce.user.prénom.capitalize} #{@locataire_candidature.annonce.user.nom.capitalize} accepte un dossier de location"
    )
  end

  def reject_locataire_notify_agent
    @locataire_candidature = params[:locataire]
    mail(
      to:       User.find(@locataire_candidature.annonce.agent_user_id.to_i).email,
      subject:  "#{@locataire_candidature.annonce.user.prénom.capitalize} #{@locataire_candidature.annonce.user.nom.capitalize[0]}. rejète un dossier de location"
    )
  end

  def reject_locataire_notify_locataire
    @locataire_candidature = params[:locataire]
    mail(
      to:       @locataire_candidature.user.email,
      subject:  "#{@locataire_candidature.annonce.user.prénom.capitalize} #{@locataire_candidature.annonce.user.nom.capitalize[0]}. rejète votre dossier de location"
    )
  end

  def reject_locataire_notify_admin
    @locataire_candidature = params[:locataire]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]

    mail(
      to:       @admin.email,
      subject:  "#{@locataire_candidature.annonce.user.prénom.capitalize} #{@locataire_candidature.annonce.user.nom.capitalize} rejète un dossier de location"
    )
  end

  # def update_locataire_notify_agent
  #   @locataire_candidature = params[:locataire]
  #   mail(
  #     to:       User.find(@locataire_candidature.annonce.agent_user_id.to_i).email,
  #     subject:  "#{Locataire.find(@locataire_candidature.locataire_id).prenom.capitalize} #{Locataire.find(@locataire_candidature.locataire_id).nom.capitalize} a mis à jour son dossier de location"
  #   )
  # end

  # def update_locataire_notify_proprio
  #   @locataire_candidature = params[:locataire]
  #   mail(
  #     to:       @locataire_candidature.annonce.user.email,
  #     subject:  "#{Locataire.find(@locataire_candidature.locataire_id).prenom.capitalize} #{Locataire.find(@locataire_candidature.locataire_id).nom.capitalize} a mis à jour son dossier de location"
  #   )
  # end

  # def update_locataire_notify_admin
  #   @locataire_candidature = params[:locataire]
  #   @admin = User.where("email = ?", "contact@realbeez.com")[0]

  #   mail(
  #     to:       @admin.email,
  #     subject:  "#{Locataire.find(@locataire_candidature.locataire_id).prenom.capitalize} #{Locataire.find(@locataire_candidature.locataire_id).nom.capitalize} a mis à jour son dossier de location"
  #   )
  # end

  def destroy_locataire_notify_agent
    @locataire_candidature = params[:locataire]
    mail(
      to:       User.find(@locataire_candidature.annonce.agent_user_id.to_i).email,
      subject:  "#{Locataire.find(@locataire_candidature.locataire_id).prenom.capitalize} #{Locataire.find(@locataire_candidature.locataire_id).nom.capitalize} a supprimé son dossier de location"
    )
  end

  def destroy_locataire_notify_proprio
    @locataire_candidature = params[:locataire]
    mail(
      to:       @locataire_candidature.annonce.user.email,
      subject:  "#{Locataire.find(@locataire_candidature.locataire_id).prenom.capitalize} #{Locataire.find(@locataire_candidature.locataire_id).nom.capitalize} a supprimé son dossier de location"
    )
  end

  def destroy_locataire_notify_admin
    @locataire_candidature = params[:locataire]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]

    mail(
      to:       @admin.email,
      subject:  "#{Locataire.find(@locataire_candidature.locataire_id).prenom.capitalize} #{Locataire.find(@locataire_candidature.locataire_id).nom.capitalize} a supprimé son dossier de location"
    )
  end

end
