class AnnoncesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_annonce, only: [:show, :edit, :update, :destroy, :checkout_agent, :checkout_proprio]

  def index
    # ===================Search by address========================
    if params.key?(:search)
      if params[:search][:distance] == ""
        @distance = 30
      else
        @distance = params[:search][:distance].to_i
      end
      if params[:search][:query].empty?
        @annonces = policy_scope(Annonce.where("statut = ?", "active")).order(created_at: :desc).page(params[:page]).per_page(9)
        @markers = @annonces.where.not(latitude: nil, longitude: nil).order(created_at: :desc).map do |annonce|
          {
            lat: annonce.latitude,
            lng: annonce.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { annonce: annonce })
          }
        end
      else
        if policy_scope(Annonce.near(params[:search][:query],@distance)).where("statut = ?", "active") != []
          @annonces = policy_scope(Annonce.near(params[:search][:query],@distance)).where("statut = ?", "active").page(params[:page]).per_page(9)
          @markers = @annonces.where.not(latitude: nil, longitude: nil).order(created_at: :desc).map do |annonce|
            {
              lat: annonce.latitude,
              lng: annonce.longitude,
              infoWindow: render_to_string(partial: "info_window", locals: { annonce: annonce })
            }
          end
        else
          @annonces = policy_scope(Annonce.near(params[:search][:query],@distance)).where("statut = ?", "active").page(params[:page]).per_page(9)
          @annonces_no_result = policy_scope(Annonce.search_annonce("paris")).where("statut = ?", "active").page(params[:page]).per_page(9)
          @markers = @annonces_no_result.where.not(latitude: nil, longitude: nil).order(created_at: :desc).map do |annonce|
            {
              lat: annonce.latitude,
              lng: annonce.longitude,
              infoWindow: render_to_string(partial: "info_window", locals: { annonce: annonce })
            }
          end
        end
      end
      # =======================Search by name =======================
    elsif params.key?(:search_all)
      if params[:search_all][:query].empty?
        @annonces = policy_scope(Annonce.where("statut = ?", "active")).order(created_at: :desc).page(params[:page]).per_page(9)
        @markers = @annonces.where.not(latitude: nil, longitude: nil).order(created_at: :desc).map do |annonce|
          {
            lat: annonce.latitude,
            lng: annonce.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { annonce: annonce })
          }
        end
      else
        if policy_scope(Annonce.search_annonce(params[:search_all][:query])).where("statut = ?", "active") != []
          @annonces = policy_scope(Annonce.search_annonce(params[:search_all][:query])).where("statut = ?", "active").page(params[:page]).per_page(9)
          @markers = @annonces.where.not(latitude: nil, longitude: nil).order(created_at: :desc).map do |annonce|
            {
              lat: annonce.latitude,
              lng: annonce.longitude,
              infoWindow: render_to_string(partial: "info_window", locals: { annonce: annonce })
            }
          end
        else
          @annonces = policy_scope(Annonce.search_annonce(params[:search_all][:query])).where("statut = ?", "active").page(params[:page]).per_page(9)
          @annonces_no_result = policy_scope(Annonce.search_annonce("paris")).where("statut = ?", "active").page(params[:page]).per_page(9)
          @markers = @annonces_no_result.where.not(latitude: nil, longitude: nil).order(created_at: :desc).map do |annonce|
            {
              lat: annonce.latitude,
              lng: annonce.longitude,
              infoWindow: render_to_string(partial: "info_window", locals: { annonce: annonce })
            }
          end
        end
      end
    else
      @annonces = policy_scope(Annonce.where("statut = ?", "active")).order(created_at: :desc).page(params[:page]).per_page(9)
      @markers = @annonces.where.not(latitude: nil, longitude: nil).order(created_at: :desc).map do |annonce|
        {
          lat: annonce.latitude,
          lng: annonce.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { annonce: annonce })
        }
      end
    end
    # if params.key?(:search_all)
    #   if params[:search_all][:query].empty?
    #     @annonces = policy_scope(Annonce.where("statut = ?", "active")).order(created_at: :desc).page(params[:page]).per_page(9)
    #     @markers = @annonces.where.not(latitude: nil, longitude: nil).order(created_at: :desc).map do |annonce|
    #       {
    #         lat: annonce.latitude,
    #         lng: annonce.longitude,
    #         infoWindow: render_to_string(partial: "info_window", locals: { annonce: annonce })
    #       }
    #     end
    #   else
    #     @annonces = policy_scope(Annonce.search_annonce(params[:search_all][:query])).where("statut = ?", "active").page(params[:page]).per_page(9)
    #     @markers = @annonces.where.not(latitude: nil, longitude: nil).order(created_at: :desc).map do |annonce|
    #       {
    #         lat: annonce.latitude,
    #         lng: annonce.longitude,
    #         infoWindow: render_to_string(partial: "info_window", locals: { annonce: annonce })
    #       }
    #     end
    #     @annonces_no_result = policy_scope(Annonce.near("paris",30)).where("statut = ?", "active").page(params[:page]).per_page(9)
    #     @markers = @annonces_no_result.where.not(latitude: nil, longitude: nil).order(created_at: :desc).map do |annonce|
    #       {
    #         lat: annonce.latitude,
    #         lng: annonce.longitude,
    #         infoWindow: render_to_string(partial: "info_window", locals: { annonce: annonce })
    #       }
    #     end
    #   end
    # else
    #   @annonces = policy_scope(Annonce.where("statut = ?", "active")).order(created_at: :desc).page(params[:page]).per_page(9)
    #   @markers = @annonces.where.not(latitude: nil, longitude: nil).order(created_at: :desc).map do |annonce|
    #     {
    #       lat: annonce.latitude,
    #       lng: annonce.longitude,
    #       infoWindow: render_to_string(partial: "info_window", locals: { annonce: annonce })
    #     }
    #   end
    # end
  end

  def mes_annonces
    @annonces = current_user.annonces.order(created_at: :desc)
    @annonces_proprio_en_cours = @annonces.select{ |annonce| annonce.statut == "active"}
    @annonces_proprio_loué = @annonces.select{ |annonce| annonce.statut == "Loué"}
    @markers = @annonces.where.not(latitude: nil, longitude: nil).map do |annonce|
      {
        lat: annonce.latitude,
        lng: annonce.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { annonce: annonce })
      }
    end
    authorize @annonces
  end

  def biens_a_gerer
    @annonces = Annonce.where("agent_user_id = ?", current_user.id.to_s).order(created_at: :desc)
    @annonces_agent_en_cours = @annonces.select{ |annonce| annonce.statut == "active"}
    @annonces_agent_loué = @annonces.select{ |annonce| annonce.statut == "Loué"}
    @markers = @annonces.where.not(latitude: nil, longitude: nil).map do |annonce|
      {
        lat: annonce.latitude,
        lng: annonce.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { annonce: annonce })
      }
    end
    authorize @annonces
  end

  def annonces_all
    @annonces = Annonce.all.order(created_at: :desc)
    @annonces_proprio_en_cours = @annonces.select{ |annonce| annonce.statut != "Loué"}
    @annonces_proprio_loué = @annonces.select{ |annonce| annonce.statut == "Loué"}
    @markers = @annonces.where.not(latitude: nil, longitude: nil).map do |annonce|
      {
        lat: annonce.latitude,
        lng: annonce.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { annonce: annonce })
      }
    end
    authorize @annonces
  end

  def checkout_agent
    authorize @annonce
    @annonce.checkout_agent = "check"
    @annonce.save
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    # Create a notification
    # Notification.create(recipient: @admin, actor: current_user, action: "checkout_agent_notify_admin", notifiable: @annonce)
    Notification.create(recipient: @annonce.user, actor: current_user, action: "checkout_agent_notify_proprio", notifiable: @annonce)
    # Send email to Admin
    mail_admin = AnnonceMailer.with(annonce: @annonce).checkout_agent_notify_admin
    mail_admin.deliver_now
    # Send email to prorio
    mail_proprio = AnnonceMailer.with(annonce: @annonce).checkout_agent_notify_proprio
    mail_proprio.deliver_now
    if @annonce.checkout_agent == "check" && @annonce.checkout_proprio == "check"
      @annonce.statut = "Loué"
      @annonce.save
    end
    redirect_to @annonce
  end

  def checkout_proprio
    authorize @annonce
    @annonce.checkout_proprio = "check"
    @annonce.save
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    @recipient = User.find(@annonce.agent_user_id)
    # # Create a notification
    # Notification.create(recipient: @admin, actor: current_user, action: "checkout_proprio_notify_admin", notifiable: @annonce)
    Notification.create(recipient: @recipient, actor: current_user, action: "checkout_proprio_notify_agent", notifiable: @annonce)
    # # Send email to Admin
    mail_admin = AnnonceMailer.with(annonce: @annonce).checkout_proprio_notify_admin
    mail_admin.deliver_now
    # # Send email to Agent
    mail_agent = AnnonceMailer.with(annonce: @annonce).checkout_proprio_notify_agent
    mail_agent.deliver_now
    # redirect_to profile_path(current_user)
    if @annonce.checkout_agent == "check" && @annonce.checkout_proprio == "check"
      @annonce.statut = "Loué"
      @annonce.save
    end
    # redirect_to @annonce
  end

  def show
    authorize @annonce
    @meetings = @annonce.meetings.order(start_time: :asc)
    @annonces = []
    @annonces << @annonce
    if @annonce.latitude != nil
      @markers = @annonces.map do |annonce|
        {
          lat: annonce.latitude,
          lng: annonce.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { annonce: annonce })
        }
      end
    end
    unless @annonce.agent_user_id.nil? || @annonce.agent_user_id == ""
      @agent_user = User.find(@annonce.agent_user_id.to_i)
    end
    @locataire_dossiers = Locataire.where("user_id = ? AND statut = ?", @annonce.agent_user_id.to_i, "active").order(created_at: :desc)
  end

  def new
    authorize @annonce = Annonce.new
    # authorize @photo = Photo.new
  end

  def create
    @annonce = Annonce.new(annonce_params)
    if @annonce.agent == "Oui"
      @email_proprietaire = User.where("email = ?", @annonce.email_proprio.downcase)[0]
      @annonce.agent_user_id = current_user.id
      if @email_proprietaire == [] || @email_proprietaire == "" || @email_proprietaire == nil
        create_user
        @annonce.user = @email_proprietaire
      else
        @annonce.user = @email_proprietaire
      end
    else
      @annonce.user = current_user
    end
    @annonce.statut = "active"
    # @annonce.price_cents = 37500
    authorize @annonce
    unless @annonce.ville == ""
      if @annonce.latitude == nil or @annonce.longitude == nil
        results = Geocoder.search("#{@annonce.ville}")
        @annonce.latitude = results.first.coordinates[0]
        @annonce.longitude = results.first.coordinates[1]
      end
    end
    if @annonce.save
      # Send email to Admin
      mail_admin = AnnonceMailer.with(annonce: @annonce).create_new_annonce
      mail_admin.deliver_now
      # for multiple upload photo
      # create_pictures
      if @annonce.email_proprio != "" && @annonce.agent == "Oui"
        # NOTIFICATION
        # Send to proprio if registered
        @proprio_array = User.where("email = ? ", @annonce.email_proprio)
        @proprio_user = User.where("email = ? ", @annonce.email_proprio)[0]
        if @proprio_array != []
          Notification.create(recipient: @proprio_user, actor: current_user, action: "create_annonce_notify_proprio", notifiable: @annonce)
        end
        # Send email to proprio
        mail_agent = AnnonceMailer.with(annonce: @annonce).create_annonce_notify_proprio
        mail_agent.deliver_now
      end
      redirect_to annonce_path(@annonce)
    else
      render :new
    end
  end

  def edit
    authorize @annonce
  end

  def update
    authorize @annonce
    if @annonce.agent == "Oui" && @annonce.agent_user_id.to_i == current_user.id || @annonce.agent == "Oui" && current_user.admin == true
      @email_proprietaire = User.where("email = ?", params[:annonce][:email_proprio].downcase)[0]
      # if params[:annonce][:agent] == "Oui"
      # @annonce.agent_user_id = current_user.id
      if @email_proprietaire == [] || @email_proprietaire == "" || @email_proprietaire == nil
        create_user
        @annonce.user = @email_proprietaire
      else
        @annonce.user = @email_proprietaire
      end
    else
      @annonce.user = current_user
    end
    # end
    if @annonce.update(annonce_params)
      redirect_to @annonce
    else
      render :edit
    end
  end

  def create_user
    user = User.create(email: params[:annonce][:email_proprio], nom: params[:annonce][:nom_proprio], prénom: params[:annonce][:prenom_proprio], téléphone: params[:annonce][:telephone_proprio],ville: "Paris", password: "123456" )
  end

  def destroy
    authorize @annonce
    @annonce.statut = "annulé"
    @annonce.save
    redirect_to annonces_path
  end

  private

  def annonce_params
    params.require(:annonce).permit(
      :agent,
      :nom_proprio,
      :prenom_proprio,
      :email_proprio,
      :titre_annonce,
      :type_de_bien,
      :meublé,
      :surface,
      :pièces,
      :classe_énergie,
      :ges,
      :description,
      :loyer_mensuel,
      :charges,
      :adresse,
      :ville,
      :email,
      :téléphone,
      :photo,
      :photo1,
      :photo2,
      :photo3,
      :photo4,
      :price_cents,
      :telephone_proprio,
      :mandat_exclusif,
      :depot_garantie,
      :duree_mandat,
      :agent_user_id
    )
  end

  # def photo_params
  #   params.require(:photo).permit(:photo1, :photo2, :photo3, :photo4, :photo5)
  # end

  def set_annonce
    @annonce = Annonce.find(params[:id])
  end

  # FOR MULTIPLE UPLOAD
  # def create_pictures
  #   images = params.dig(:annonce, :pictures) || []
  #   images.each do |image|
  #     @annonce.pictures.create(photo: image)
  #   end
  # end

end
