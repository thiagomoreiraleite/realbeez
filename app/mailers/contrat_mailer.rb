class ContratMailer < ApplicationMailer

  def create_bail_notify_locataire
    @contrat = params[:contrat]
    @locataire =  Locataire.find(@contrat.locataire_candidature.locataire_id)
    mail(
      to:       @locataire.email,
      subject:  "Votre contrat de location est prêt à être signé."
    )
  end

  def create_bail_notify_agent
    @contrat = params[:contrat]
    @agent =  User.find(@contrat.locataire_candidature.annonce.agent_user_id.to_i)
    @locataire =  Locataire.find(@contrat.locataire_candidature.locataire_id)
    mail(
      to:       @agent.email,
      subject:  "Contrat de location à signer par #{@locataire.prenom.capitalize} #{@locataire.nom.capitalize}."
    )
  end

  def create_bail_notify_proprio
    @contrat = params[:contrat]
    @agent =  User.find(@contrat.locataire_candidature.annonce.agent_user_id.to_i)
    @locataire =  Locataire.find(@contrat.locataire_candidature.locataire_id)
    @proprio = @contrat.locataire_candidature.annonce.user
    mail(
      to:       @proprio.email,
      subject:  "Votre contrat de location est prêt à être signé."
    )
  end

  def create_bail_notify_admin
    @contrat = params[:contrat]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    @locataire =  Locataire.find(@contrat.locataire_candidature.locataire_id)
    mail(
      to:       @admin.email,
      subject:  "Contrat de location à signer par #{@locataire.prenom.capitalize} #{@locataire.nom.capitalize}."
    )
  end

  def signature_proprio_notify_admin
    @contrat = params[:contrat]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    @locataire =  Locataire.find(@contrat.locataire_candidature.locataire_id)
    @proprio = @contrat.locataire_candidature.annonce.user
    mail(
      to:       @admin.email,
      subject:  "Contrat de location signé par le propriétaire #{@proprio.prénom.capitalize} #{@proprio.nom.capitalize}."
    )
  end

  def signature_proprio_notify_agent
    @contrat = params[:contrat]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    @locataire =  Locataire.find(@contrat.locataire_candidature.locataire_id)
    @proprio = @contrat.locataire_candidature.annonce.user
    @agent = User.find(@contrat.locataire_candidature.annonce.agent_user_id.to_i)
    mail(
      to:       @agent.email,
      subject:  "Contrat de location signé par le propriétaire #{@proprio.prénom.capitalize} #{@proprio.nom.capitalize}."
    )
  end

  def signature_locataire_notify_admin
    @contrat = params[:contrat]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    @locataire =  Locataire.find(@contrat.locataire_candidature.locataire_id)
    mail(
      to:       @admin.email,
      subject:  "Contrat de location signé par la locataire #{@locataire.prenom.capitalize} #{@locataire.nom.capitalize}."
    )
  end

  def signature_locataire_notify_agent
    @contrat = params[:contrat]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    @locataire =  Locataire.find(@contrat.locataire_candidature.locataire_id)
    @agent =  User.find(@contrat.locataire_candidature.annonce.agent_user_id.to_i)
    mail(
      to:       @agent.email,
      subject:  "Contrat de location signé par la locataire #{@locataire.prenom.capitalize} #{@locataire.nom.capitalize}."
    )
  end

  def signature_locataire_notify_proprio
    @contrat = params[:contrat]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    @locataire =  Locataire.find(@contrat.locataire_candidature.locataire_id)
    @proprio = @contrat.locataire_candidature.annonce.user
    mail(
      to:       @proprio.email,
      subject:  "Contrat de location signé par la locataire #{@locataire.prenom.capitalize} #{@locataire.nom.capitalize}."
    )
  end

end
