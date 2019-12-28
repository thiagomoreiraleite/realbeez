class LocatairesController < ApplicationController

  before_action :set_locataire, only: [:show, :edit, :update, :destroy, :accept_locataire, :reject_locataire]

  def show
    authorize @locataire
  end

  def new
    authorize @locataire = Locataire.new
    @annonce = Annonce.find(params[:annonce_id])
  end

  def create
    authorize @locataire = Locataire.new(locataire_params)
    @annonce = Annonce.find(params[:annonce_id])
    @locataire.annonce = @annonce
    @locataire.user = current_user
    @locataire.statut_proprietaire = "En cours"
    if @locataire.save
      @admin = User.where("email = ?", "contact@realbeez.com")[0]
      # Create a notification
      if @locataire.agent == "Non" && @locataire.annonce.agent_user_id != nil
        Notification.create(recipient: User.find(@locataire.annonce.agent_user_id.to_i), actor: current_user, action: "create_locataire_notify_agent", notifiable: @locataire)
        # Send email to Agent
        mail_agent = LocataireMailer.with(locataire: @locataire).create_locataire_notify_agent
        mail_agent.deliver_now
      end
      # Notification.create(recipient: @admin, actor: current_user, action: "create_locataire_notify_admin", notifiable: @locataire)
      Notification.create(recipient: @locataire.annonce.user, actor: current_user, action: "create_locataire_notify_proprio", notifiable: @locataire)
      # Send email to Admin
      mail_admin = LocataireMailer.with(locataire: @locataire).create_locataire_notify_admin
      mail_admin.deliver_now
      # Send email to prorio
      mail_proprio = LocataireMailer.with(locataire: @locataire).create_locataire_notify_proprio
      mail_proprio.deliver_now
      if @locataire.agent == "Oui"
        redirect_to locataires_agent_path
      else
        redirect_to locataires_locataire_path
      end
    end
  end

  def edit
    authorize @locataire
  end

  def update
    authorize @locataire
    if @locataire.update(locataire_params)
      redirect_to locataire_path(@locataire)
    else
      render :edit
    end
  end

  def destroy
    authorize @locataire
    @locataire.statut = "annulé"
    @locataire.save
    redirect_to locataires_locataire_path
  end

  def index
    @locataires = policy_scope(Locataire).order(created_at: :asc)
    # # For Admin
    # @locataires_all = Locataire.all
    # @locataires_admin_en_cours = @locataires_all.select{ |l| l.statut_proprietaire == "En cours" }.sort_by{ |l| l.updated_at }
    # @locataires_admin_accepté = @locataires_all.select{ |l| l.statut_proprietaire == "Accepté" }.sort_by{ |l| l.updated_at }
    # @locataires_admin_rejeté = @locataires_all.select{ |l| l.statut_proprietaire == "Rejeté" }.sort_by{ |l| l.updated_at }
    # # For locataire
    # @locataires_locataire_en_cours = Locataire.where("user_id = ? AND statut_proprietaire = ?", current_user.id, "En cours").order(created_at: :asc)
    # @locataires_locataire_accepté = Locataire.where("user_id = ? AND statut_proprietaire = ?", current_user.id, "Accepté").order(created_at: :asc)
    # @locataires_locataire_rejeté = Locataire.where("user_id = ? AND statut_proprietaire = ?", current_user.id, "Rejeté").order(created_at: :asc)
    # # For proprio
    # @annonces = current_user.annonces
    # @locataires = []
    # @annonces.each do |annonce|
    #   annonce.locataires.each do |locataire|
    #     @locataires << locataire
    #   end
    # end
    # @locataires_proprietaire_en_cours = @locataires.select{ |l| l.statut_proprietaire == "En cours" }.sort_by{ |l| l.updated_at }
    # @locataires_proprietaire_accepté = @locataires.select{ |l| l.statut_proprietaire == "Accepté" }.sort_by{ |l| l.updated_at }
    # @locataires_proprietaire_rejeté = @locataires.select{ |l| l.statut_proprietaire == "Rejeté" }.sort_by{ |l| l.updated_at }
    # # For Agent
    # @annonces = Annonce.where("agent_user_id = ?", current_user.id.to_s)
    # @locataires = []
    # @annonces.each do |annonce|
    #   annonce.locataires.each do |locataire|
    #     @locataires << locataire
    #   end
    # end
    # @locataires_agent_en_cours = @locataires.select{ |l| l.statut_proprietaire == "En cours" }.sort_by{ |l| l.updated_at }
    # @locataires_agent_accepté = @locataires.select{ |l| l.statut_proprietaire == "Accepté" }.sort_by{ |l| l.updated_at }
    # @locataires_agent_rejeté = @locataires.select{ |l| l.statut_proprietaire == "Rejeté" }.sort_by{ |l| l.updated_at }
  end

  def accept_locataire
    authorize @locataire
    @locataire.statut_proprietaire = "Accepté"
    if @locataire.save
      @admin = User.where("email = ?", "contact@realbeez.com")[0]
      # Create a notification for agent
      if @locataire.annonce.agent_user_id != nil
        Notification.create(recipient: User.find(@locataire.annonce.agent_user_id.to_i), actor: current_user, action: "accept_locataire_notify_agent", notifiable: @locataire)
        # Send email to Agent
        mail_agent = LocataireMailer.with(locataire: @locataire).accept_locataire_notify_agent
        mail_agent.deliver_now
      end
      # Create notification for locataire
      if @locataire.agent == "Non"
        Notification.create(recipient: @locataire.user, actor: current_user, action: "accept_locataire_notify_locataire", notifiable: @locataire)
        # Send email to locataire
        mail_locataire = LocataireMailer.with(locataire: @locataire).accept_locataire_notify_locataire
        mail_locataire.deliver_now
      end
      # Send email to Admin
      mail_admin = LocataireMailer.with(locataire: @locataire).accept_locataire_notify_admin
      mail_admin.deliver_now
      # redirect
      redirect_to locataires_proprio_path
    end
  end

  def reject_locataire
    authorize @locataire
    @locataire.statut_proprietaire = "Rejeté"
    if @locataire.save
      @admin = User.where("email = ?", "contact@realbeez.com")[0]
      # Create a notification for agent
      if @locataire.annonce.agent_user_id != nil
        Notification.create(recipient: User.find(@locataire.annonce.agent_user_id.to_i), actor: current_user, action: "reject_locataire_notify_agent", notifiable: @locataire)
        # Send email to Agent
        mail_agent = LocataireMailer.with(locataire: @locataire).reject_locataire_notify_agent
        mail_agent.deliver_now
      end
      # Create notification for locataire
      if @locataire.agent == "Non"
        Notification.create(recipient: @locataire.user, actor: current_user, action: "reject_locataire_notify_locataire", notifiable: @locataire)
        # Send email to locataire
        mail_locataire = LocataireMailer.with(locataire: @locataire).reject_locataire_notify_locataire
        mail_locataire.deliver_now
      end
      # Send email to Admin
      mail_admin = LocataireMailer.with(locataire: @locataire).reject_locataire_notify_admin
      mail_admin.deliver_now
      # redirect
      redirect_to locataires_proprio_path
    end
  end

  def locataires_locataire
    authorize @locataires = policy_scope(Locataire).order(created_at: :desc)
    @locataires_locataire_en_cours = Locataire.where("user_id = ? AND statut_proprietaire = ? AND agent = ? AND statut != ? ", current_user.id, "En cours", "Non", "annulé").order(created_at: :asc)
    @locataires_locataire_accepté = Locataire.where("user_id = ? AND statut_proprietaire = ? AND agent = ? AND statut != ?", current_user.id, "Accepté", "Non", "annulé").order(created_at: :asc)
    @locataires_locataire_rejeté = Locataire.where("user_id = ? AND statut_proprietaire = ? AND agent = ? AND statut != ?", current_user.id, "Rejeté", "Non", "annulé").order(created_at: :asc)
  end

  def locataires_proprio
    authorize @locataires = policy_scope(Locataire).order(created_at: :desc)
    @annonces = current_user.annonces
    @locataires = []
    @annonces.each do |annonce|
      annonce.locataires.each do |locataire|
        if locataire.statut != "annulé"
          @locataires << locataire
        end
      end
    end
    @locataires_proprietaire_en_cours = @locataires.select{ |l| l.statut_proprietaire == "En cours" }.sort_by{ |l| l.updated_at }
    @locataires_proprietaire_accepté = @locataires.select{ |l| l.statut_proprietaire == "Accepté" }.sort_by{ |l| l.updated_at }
    @locataires_proprietaire_rejeté = @locataires.select{ |l| l.statut_proprietaire == "Rejeté" }.sort_by{ |l| l.updated_at }
  end

  def locataires_agent
    authorize @locataires = policy_scope(Locataire).order(created_at: :desc)
    @annonces = Annonce.where("agent_user_id = ?", current_user.id.to_s)
    @locataires = []
    @annonces.each do |annonce|
      annonce.locataires.each do |locataire|
        if locataire.statut != "annulé"
          @locataires << locataire
        end
      end
    end
    @locataires_agent_en_cours = @locataires.select{ |l| l.statut_proprietaire == "En cours" }.sort_by{ |l| l.updated_at }
    @locataires_agent_accepté = @locataires.select{ |l| l.statut_proprietaire == "Accepté" }.sort_by{ |l| l.updated_at }
    @locataires_agent_rejeté = @locataires.select{ |l| l.statut_proprietaire == "Rejeté" }.sort_by{ |l| l.updated_at }
  end

  def locataires_all
    authorize @locataires = policy_scope(Locataire).order(created_at: :desc)
    @locataires_all = Locataire.all
    @locataires_admin_en_cours = @locataires_all.select{ |l| l.statut_proprietaire == "En cours" }.sort_by{ |l| l.updated_at }
    @locataires_admin_accepté = @locataires_all.select{ |l| l.statut_proprietaire == "Accepté" }.sort_by{ |l| l.updated_at }
    @locataires_admin_rejeté = @locataires_all.select{ |l| l.statut_proprietaire == "Rejeté" }.sort_by{ |l| l.updated_at }
  end

  private

  def set_locataire
    @locataire = Locataire.find(params[:id])
  end

  def locataire_params
    params.require(:locataire).permit(
      :agent,
      :nom,
      :prenom,
      :adresse,
      :ville,
      :tel,
      :email,
      :id_recto,
      :id_verso,
      :justif_dom,
      :fiche_paye_mois1,
      :fiche_paye_mois2,
      :fiche_paye_mois3,
      :contrat,
      :nom_garant,
      :prenom_garant,
      :adresse_garant,
      :ville_garant,
      :tel_garant,
      :email_garant,
      :id_recto_garant,
      :id_verso_garant,
      :justif_dom_garant,
      :fiche_paye_mois1_garant,
      :fiche_paye_mois2_garant,
      :fiche_paye_mois3_garant,
      :contrat_garant,
      :message
    )
  end

end
