class ContratsController < ApplicationController
  before_action :set_contrat, only: [:show, :edit , :update]

  def new
    authorize @contrat = Contrat.new
    @locataire_candidature = LocataireCandidature.find(params[:locataire_candidature_id])
  end

  def create
    authorize @contrat = Contrat.new
    @locataire_candidature = LocataireCandidature.find(params[:locataire_candidature_id])
    @contrat.locataire_candidature = @locataire_candidature
    @contrat.user = current_user
    @contrat.qualite_bailleur = "Personne physique"
    @contrat.nom_bailleur = "#{@locataire_candidature.annonce.user.prénom} #{@locataire_candidature.annonce.user.nom}"
    @contrat.denomination_bailleur = "n/a"
    @contrat.adresse_bailleur = "#{@locataire_candidature.annonce.user.adresse} #{@locataire_candidature.annonce.user.ville}"
    @contrat.email_bailleur = @locataire_candidature.annonce.user.email
    # Mandataire
    if @locataire_candidature.annonce.agent_user_id != nil
      @contrat.mandataire = true
      @contrat.nom_mandataire = "#{User.find(@locataire_candidature.annonce.agent_user_id.to_i).prénom} #{User.find(@locataire_candidature.annonce.agent_user_id.to_i).nom}"
      @contrat.denomination_mandataire = "Realbeez"
      @contrat.adresse_mandataire = "90 avenue de Choisy, 75013 Paris"
      @contrat.activite_mandataire = "Agence immobilière"
      @contrat.carte_pro = "CPI 7501 2020 000 044 172"
    else
      @contrat.mandataire = false
      @contrat.nom_mandataire = "n/a"
      @contrat.denomination_mandataire = "n/a"
      @contrat.societe_civile = "Non"
      @contrat.adresse_mandataire = "n/a"
      @contrat.activite_mandataire = "n/a"
      @contrat.carte_pro = "n/a"
    end
    @contrat.garant = "#{Locataire.find(@locataire_candidature.locataire_id).prenom_garant} #{Locataire.find(@locataire_candidature.locataire_id).nom_garant} résidant au #{Locataire.find(@locataire_candidature.locataire_id).adresse}, #{Locataire.find(@locataire_candidature.locataire_id).ville}"
    # Locataire
    @contrat.nom_locataire = []
    @contrat.nom_locataire << "#{Locataire.find(@locataire_candidature.locataire_id).prenom} #{Locataire.find(@locataire_candidature.locataire_id).nom} (email : #{Locataire.find(@locataire_candidature.locataire_id).email})"
    @locataire = Locataire.find(@locataire_candidature.locataire_id)
    @locataire.locataire_supplementaires.each do |loc|
      @contrat.nom_locataire << "#{loc.prenom} #{loc.nom} (email : #{loc.email})"
    end
    @contrat.adresse_logement = "#{@locataire_candidature.annonce.adresse} #{@locataire_candidature.annonce.ville}"
    # @contrat.type_habitat_immeuble = "collectif"
    # @contrat.type_habitat = "copropriété"
    # @contrat.periode_construction = "à compléter"
    @contrat.surface = @locataire_candidature.annonce.surface
    @contrat.nb_piece = @locataire_candidature.annonce.pièces
    # @contrat.autre_partie_logement = "n/a"
    @contrat.autre_autre_partie_logement = ""
    @contrat.equipement = "n/a"
    # @contrat.chauffage = "à compléter"
    # @contrat.eau_chaude = "à compléter"
    @contrat.destination_locaux = "usage d'habitation"
    @contrat.cave = false
    @contrat.cave_detail = ""
    @contrat.parking = false
    @contrat.parking_detail = ""
    @contrat.garage = false
    @contrat.garage_detail = ""
    @contrat.autre_partie_privative = false
    @contrat.autre_partie_privative_detail = ""
    @contrat.partie_commune = "n/a"
    @contrat.autre_partie_commune = "n/a"
    @contrat.equipement_technologique = "n/a"
    @contrat.date_prise_effet = "à compléter"
    @contrat.duree_contrat = "3 ans"
    @contrat.nb_duree_reduite = "n/a"
    @contrat.justif_duree_reduite = "n/a"
    @contrat.loyer_mensuel = @locataire_candidature.annonce.loyer_mensuel - @locataire_candidature.annonce.charges
    @contrat.decret_evolution_loyer = false
    @contrat.loyer_reference = false
    @contrat.montant_loyer_reference = ""
    @contrat.montant_loyer_majore = ""
    @contrat.justif_complement_loyer = "n/a"
    @contrat.loyer_dernier_locataire = "à compléter"
    @contrat.date_revision_loyer = "n/a"
    @contrat.reference_irl = "4T 2019 : 130,26"
    @contrat.modalite_paiement_charges = "Provisions sur charges avec régularisation annuelle"
    @contrat.provision_charges = "n/a"
    @contrat.modalite_revision_forfait = "n/a"
    @contrat.contribution_economie_charge = "n/a"
    @contrat.justif_contribution_travaux = "n/a"
    @contrat.colocation_assurance = false
    @contrat.montant_annuel_assurance = "n/a"
    @contrat.montant_mensuel_assurance = "n/a"
    @contrat.perdiodicite_paiement = "mensuel"
    @contrat.paiement_echoir_echu = "à échoir"
    @contrat.date_periode_paiement = "le 1er de chaque mois"
    @contrat.lieu_paiement = @locataire_candidature.annonce.ville
    @contrat.loyer_hors_charges = @locataire_candidature.annonce.loyer_mensuel - @locataire_candidature.annonce.charges
    @contrat.charge_recuperable = @locataire_candidature.annonce.charges
    @contrat.contribution_partage_economie_charges = "n/a"
    @contrat.colocation_assurance_recuperable = "n/a"
    @contrat.hausse_baisse_loyer = "n/a"
    @contrat.modalite_hausse_annuelle = "n/a"
    @contrat.travaux_amelioration = "n/a"
    @contrat.travaux_majoration_loyer = "n/a"
    @contrat.travaux_diminution_loyer = "n/a"
    @contrat.depot_garantie = @locataire_candidature.annonce.loyer_mensuel - @locataire_candidature.annonce.charges
    @contrat.honoraires_visite_bail = 315
    @contrat.honoraires_etat_lieux = 60
    @contrat.honoraires_autres = "n/a"
    @contrat.autre_condition = "n/a"
    @contrat.date_signature = @contrat.created_at.strftime("%d/%m/%Y")
    @contrat.lieu_signature = @locataire_candidature.annonce.ville
    @contrat.signature_bailleur
    @contrat.signature_locataire
    if @contrat.save
      # NOTIFICATION
      # Send to Locataire if registered
      @locataire_array = User.where("email = ? ", Locataire.find(@contrat.locataire_candidature.locataire_id).email)
      @locataire_user = User.where("email = ? ", Locataire.find(@contrat.locataire_candidature.locataire_id).email)[0]
      if @locataire_array != []
        Notification.create(recipient: @locataire_user, actor: current_user, action: "create_bail_notify_locataire", notifiable: @contrat)
      end
      # Send notification to Agent if agent assigned and if landlord created the contrat
      if @contrat.locataire_candidature.annonce.agent_user_id != nil
        if @contrat.user == @contrat.locataire_candidature.annonce.user
          @agent_user = User.find(@contrat.locataire_candidature.annonce.agent_user_id.to_i)
          Notification.create(recipient: @agent_user, actor: current_user, action: "create_bail_notify_agent", notifiable: @contrat)
          # Send email to Agent if agent assigned
          mail_agent = ContratMailer.with(contrat: @contrat).create_bail_notify_agent
          mail_agent.deliver_now
        end

        # Send notification to proprio if agent created the contrat
        if @contrat.user.id.to_s == @contrat.locataire_candidature.annonce.agent_user_id
          @proprio_user = @contrat.locataire_candidature.annonce.user
          Notification.create(recipient: @proprio_user, actor: current_user, action: "create_bail_notify_proprio", notifiable: @contrat)
          # Send email to proprio if agent created contrat
          mail_agent = ContratMailer.with(contrat: @contrat).create_bail_notify_proprio
          mail_agent.deliver_now
        end
      end

      # EMAIL
      # Send to Locataire, use email in dossier_locataire
      mail_locataire = ContratMailer.with(contrat: @contrat).create_bail_notify_locataire
      mail_locataire.deliver_now
      # Send to Admin
      mail_admin = ContratMailer.with(contrat: @contrat).create_bail_notify_admin
      mail_admin.deliver_now
      redirect_to contrat_path(@contrat)
    else
      render :new
    end
  end

  def show
    authorize @contrat
  end

  def edit
    authorize @contrat
  end

  def update
    authorize @contrat
    if @contrat.update(contrat_params)
      redirect_to @contrat
    else
      render :edit
    end
  end

  private

  def set_contrat
    @contrat = Contrat.find(params[:id])
  end

  def contrat_params
    params.require(:contrat).permit(
      :qualite_bailleur,
      :nom_bailleur,
      :denomination_bailleur,
      :adresse_bailleur,
      :email_bailleur,
      :mandataire,
      :nom_mandataire,
      :denomination_mandataire,
      :adresse_mandataire,
      :activite_mandataire,
      :carte_pro,
      :adresse_logement,
      :type_habitat_immeuble,
      :type_habitat,
      :periode_construction,
      :surface,
      :nb_piece,
      :equipement,
      :chauffage,
      :eau_chaude,
      :destination_locaux,
      :cave,
      :cave_detail,
      :parking,
      :parking_detail,
      :garage,
      :garage_detail,
      :autre_partie_privative,
      :autre_partie_privative_detail,
      :autre_partie_commune,
      :equipement_technologique,
      :date_prise_effet,
      :duree_contrat,
      :nb_duree_reduite,
      :justif_duree_reduite,
      :loyer_mensuel,
      :decret_evolution_loyer,
      :loyer_reference,
      :montant_loyer_reference,
      :montant_loyer_majore,
      :justif_complement_loyer,
      :loyer_dernier_locataire,
      :date_revision_loyer,
      :reference_irl,
      :modalite_paiement_charges,
      :provision_charges,
      :modalite_revision_forfait,
      :contribution_economie_charge,
      :justif_contribution_travaux,
      :colocation_assurance,
      :montant_annuel_assurance,
      :montant_mensuel_assurance,
      :perdiodicite_paiement,
      :paiement_echoir_echu,
      :date_periode_paiement,
      :lieu_paiement,
      :loyer_hors_charges,
      :charge_recuperable,
      :contribution_partage_economie_charges,
      :colocation_assurance_recuperable,
      :hausse_baisse_loyer,
      :modalite_hausse_annuelle,
      :travaux_amelioration,
      :travaux_majoration_loyer,
      :travaux_diminution_loyer,
      :depot_garantie,
      :honoraires_visite_bail,
      :honoraires_etat_lieux,
      :honoraires_autres,
      :autre_condition,
      :date_signature,
      :lieu_signature,
      :signature_bailleur,
      :signature_locataire,
      :autre_autre_partie_logement,
      :societe_civile,
      :garant,
      nom_locataire: [],
      partie_commune: [],
      autre_partie_logement: []
    )
  end
end
