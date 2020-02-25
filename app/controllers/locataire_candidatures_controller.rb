class LocataireCandidaturesController < ApplicationController
  before_action :set_locataire_candidature, only: [:show, :edit, :update, :destroy, :accept_locataire, :reject_locataire]

  def show
    authorize @locataire_candidature
  end

  def new
    authorize @locataire_candidature = LocataireCandidature.new
    @annonce = Annonce.find(params[:annonce_id])
    @dossier_location = []
    current_user.locataires.each do |locataire|
      if locataire.statut == "active"
        @dossier_location << "Réf. ID-#{locataire.id} | #{locataire.prenom} #{locataire.nom} - #{locataire.email}"
      end
    end
    @locataire_dossiers = Locataire.where("user_id = ? AND statut = ?", current_user.id, "active")

    # nested model locataire_supplementaire
    # @locataire.locataire_supplementaires.build
    # @locataire.documents.build
  end

  def create
    authorize @locataire_candidature = LocataireCandidature.new(locataire_candidature_params)
    @annonce = Annonce.find(params[:annonce_id])
    @locataire_candidature.annonce = @annonce
    @locataire_candidature.user = current_user
    @locataire_candidature.statut_proprietaire = "En cours"
    @locataire_candidature.statut = "active"
    @locataire_candidature.locataire_id = @locataire_candidature.locataire_email.match(/\d+/)[0].to_i
    if @locataire_candidature.save
      @admin = User.where("email = ?", "contact@realbeez.com")[0]
      # Create a notification
      if @locataire_candidature.agent == "Non" && @locataire_candidature.annonce.agent_user_id != nil
        Notification.create(recipient: User.find(@locataire_candidature.annonce.agent_user_id.to_i), actor: current_user, action: "create_locataire_notify_agent", notifiable: @locataire_candidature)
        # Send email to Agent
        mail_agent = LocataireCandidatureMailer.with(locataire: @locataire_candidature).create_locataire_notify_agent
        mail_agent.deliver_now
      end
      # Notification.create(recipient: @admin, actor: current_user, action: "create_locataire_notify_admin", notifiable: @locataire_candidature)
      Notification.create(recipient: @locataire_candidature.annonce.user, actor: current_user, action: "create_locataire_notify_proprio", notifiable: @locataire_candidature)
      # Send email to Admin
      mail_admin = LocataireCandidatureMailer.with(locataire: @locataire_candidature).create_locataire_notify_admin
      mail_admin.deliver_now
      # Send email to prorio
      mail_proprio = LocataireCandidatureMailer.with(locataire: @locataire_candidature).create_locataire_notify_proprio
      mail_proprio.deliver_now
      if @locataire_candidature.agent == "Oui"
        redirect_to locataires_agent_path
      else
        redirect_to locataires_locataire_path
      end
    else
      render :new
    end
  end

  # def edit
  #   authorize @locataire_candidature
  #   @locataire_dossiers = Locataire.where("user_id = ? AND statut = ?", current_user.id, "active")
  # end

  # def update
  #   authorize @locataire_candidature
  #   if @locataire_candidature.update_attributes(locataire_candidature_params)
  #     @admin = User.where("email = ?", "contact@realbeez.com")[0]
  #     # Create a notification
  #     if @locataire_candidature.agent == "Non" && @locataire_candidature.annonce.agent_user_id != nil
  #       Notification.create(recipient: User.find(@locataire_candidature.annonce.agent_user_id.to_i), actor: current_user, action: "update_locataire_notify_agent", notifiable: @locataire_candidature)
  #       # Send email to Agent
  #       mail_agent = LocataireCandidatureMailer.with(locataire: @locataire_candidature).update_locataire_notify_agent
  #       mail_agent.deliver_now
  #     end
  #     # Notification.create(recipient: @admin, actor: current_user, action: "create_locataire_notify_admin", notifiable: @locataire_candidature)
  #     Notification.create(recipient: @locataire_candidature.annonce.user, actor: current_user, action: "update_locataire_notify_proprio", notifiable: @locataire_candidature)
  #     # Send email to Admin
  #     mail_admin = LocataireCandidatureMailer.with(locataire: @locataire_candidature).update_locataire_notify_admin
  #     mail_admin.deliver_now
  #     # Send email to prorio
  #     mail_proprio = LocataireCandidatureMailer.with(locataire: @locataire_candidature).update_locataire_notify_proprio
  #     mail_proprio.deliver_now
  #     redirect_to locataire_candidature_path(@locataire_candidature)
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    authorize @locataire_candidature
    @locataire_candidature.statut = "annulé"
    @locataire_candidature.save
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    # Create a notification
    if @locataire_candidature.agent == "Non" && @locataire_candidature.annonce.agent_user_id != nil
      Notification.create(recipient: User.find(@locataire_candidature.annonce.agent_user_id.to_i), actor: current_user, action: "destroy_locataire_notify_agent", notifiable: @locataire_candidature)
      # Send email to Agent
      mail_agent = LocataireCandidatureMailer.with(locataire: @locataire_candidature).destroy_locataire_notify_agent
      mail_agent.deliver_now
    end
    # Notification.create(recipient: @admin, actor: current_user, action: "create_locataire_notify_admin", notifiable: @locataire)
    Notification.create(recipient: @locataire_candidature.annonce.user, actor: current_user, action: "destroy_locataire_notify_proprio", notifiable: @locataire_candidature)
    # Send email to Admin
    mail_admin = LocataireCandidatureMailer.with(locataire: @locataire_candidature).destroy_locataire_notify_admin
    mail_admin.deliver_now
    # Send email to prorio
    mail_proprio = LocataireCandidatureMailer.with(locataire: @locataire_candidature).destroy_locataire_notify_proprio
    mail_proprio.deliver_now
    redirect_to locataires_locataire_path
  end

  def index
    @locataire_candidatures = policy_scope(LocataireCandidature).order(created_at: :asc)
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
    authorize @locataire_candidature
    @locataire_candidature.statut_proprietaire = "Accepté"
    if @locataire_candidature.save
      @admin = User.where("email = ?", "contact@realbeez.com")[0]
      # Create a notification for agent
      if @locataire_candidature.annonce.agent_user_id != nil
        Notification.create(recipient: User.find(@locataire_candidature.annonce.agent_user_id.to_i), actor: current_user, action: "accept_locataire_notify_agent", notifiable: @locataire_candidature)
        # Send email to Agent
        mail_agent = LocataireCandidatureMailer.with(locataire: @locataire_candidature).accept_locataire_notify_agent
        mail_agent.deliver_now
      end
      # Create notification for locataire
      if @locataire_candidature.agent == "Non"
        Notification.create(recipient: @locataire_candidature.user, actor: current_user, action: "accept_locataire_notify_locataire", notifiable: @locataire_candidature)
        # Send email to locataire
        mail_locataire = LocataireCandidatureMailer.with(locataire: @locataire_candidature).accept_locataire_notify_locataire
        mail_locataire.deliver_now
      end
      # Send email to Admin
      mail_admin = LocataireCandidatureMailer.with(locataire: @locataire_candidature).accept_locataire_notify_admin
      mail_admin.deliver_now
      # redirect
      redirect_to locataire_candidature_path(@locataire_candidature)
    end
  end

  def reject_locataire
    authorize @locataire_candidature
    @locataire_candidature.statut_proprietaire = "Rejeté"
    if @locataire_candidature.save
      @admin = User.where("email = ?", "contact@realbeez.com")[0]
      # Create a notification for agent
      if @locataire_candidature.annonce.agent_user_id != nil
        Notification.create(recipient: User.find(@locataire_candidature.annonce.agent_user_id.to_i), actor: current_user, action: "reject_locataire_notify_agent", notifiable: @locataire_candidature)
        # Send email to Agent
        mail_agent = LocataireCandidatureMailer.with(locataire: @locataire_candidature).reject_locataire_notify_agent
        mail_agent.deliver_now
      end
      # Create notification for locataire
      if @locataire_candidature.agent == "Non"
        Notification.create(recipient: @locataire_candidature.user, actor: current_user, action: "reject_locataire_notify_locataire", notifiable: @locataire_candidature)
        # Send email to locataire
        mail_locataire = LocataireCandidatureMailer.with(locataire: @locataire_candidature).reject_locataire_notify_locataire
        mail_locataire.deliver_now
      end
      # Send email to Admin
      mail_admin = LocataireCandidatureMailer.with(locataire: @locataire_candidature).reject_locataire_notify_admin
      mail_admin.deliver_now
      # redirect
      # redirect
      redirect_to locataire_candidature_path(@locataire_candidature)
    end
  end

  def locataires_locataire
    authorize @locataires = policy_scope(LocataireCandidature).order(created_at: :desc)
    @locataires_locataire_en_cours = LocataireCandidature.where("user_id = ? AND statut_proprietaire = ? AND agent = ? AND statut = ?", current_user.id, "En cours", "Non", "active").order(created_at: :asc)
    @locataires_locataire_accepté = LocataireCandidature.where("user_id = ? AND statut_proprietaire = ? AND agent = ? AND statut = ?", current_user.id, "Accepté", "Non", "active").order(created_at: :asc)
    @locataires_locataire_rejeté = LocataireCandidature.where("user_id = ? AND statut_proprietaire = ? AND agent = ? AND statut = ?", current_user.id, "Rejeté", "Non", "active").order(created_at: :asc)
    @locataire_dossiers = Locataire.where("user_id = ? AND statut = ?", current_user.id, "active")
  end

  def locataires_proprio
    authorize @locataires = policy_scope(LocataireCandidature).order(created_at: :desc)
    @annonces = current_user.annonces
    @locataires = []
    @annonces.each do |annonce|
      annonce.locataire_candidatures.each do |locataire|
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
    authorize @locataires = policy_scope(LocataireCandidature).order(created_at: :desc)
    @annonces = Annonce.where("agent_user_id = ?", current_user.id.to_s)
    @locataires = []
    @annonces.each do |annonce|
      annonce.locataire_candidatures.each do |locataire|
        if locataire.statut != "annulé"
          @locataires << locataire
        end
      end
    end
    @locataires_agent_en_cours = @locataires.select{ |l| l.statut_proprietaire == "En cours" }.sort_by{ |l| l.updated_at }
    @locataires_agent_accepté = @locataires.select{ |l| l.statut_proprietaire == "Accepté" }.sort_by{ |l| l.updated_at }
    @locataires_agent_rejeté = @locataires.select{ |l| l.statut_proprietaire == "Rejeté" }.sort_by{ |l| l.updated_at }
    @locataire_dossiers = Locataire.where("user_id = ? AND statut = ?", current_user.id, "active")
  end

  def locataires_all
    authorize @locataires = policy_scope(LocataireCandidature).order(created_at: :desc)
    @locataires_all = LocataireCandidature.all
    @locataires_admin_en_cours = @locataires_all.select{ |l| l.statut_proprietaire == "En cours"}.sort_by{ |l| l.updated_at }
    @locataires_admin_accepté = @locataires_all.select{ |l| l.statut_proprietaire == "Accepté"}.sort_by{ |l| l.updated_at }
    @locataires_admin_rejeté = @locataires_all.select{ |l| l.statut_proprietaire == "Rejeté"}.sort_by{ |l| l.updated_at }
  end

  private

  def set_locataire_candidature
    @locataire_candidature = LocataireCandidature.find(params[:id])
  end

  def locataire_candidature_params
    params.require(:locataire_candidature).permit(:agent, :message, :locataire_email)
  end

end
