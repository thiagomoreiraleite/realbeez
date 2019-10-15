class AnnoncesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_annonce, only: [:show, :edit, :update, :destroy, :checkout_agent, :checkout_proprio]

  def index

    # @annonces = policy_scope(Annonce.geocoded) #returns flats with coordinates

    # @markers = @annonces.map do |annonce|
    #   {
    #     lat: annonce.latitude,
    #     lng: annonce.longitude
    #   }
    # end

    if params.key?(:search)
      if params[:search][:query].empty?
        @annonces = policy_scope(Annonce).order(created_at: :desc).page(params[:page]).per_page(9)
        @markers = @annonces.where.not(latitude: nil, longitude: nil).where("statut = ?", "active").order(created_at: :desc).map do |annonce|
          {
            lat: annonce.latitude,
            lng: annonce.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { annonce: annonce })
          }
        end
      else
        @annonces = policy_scope(Annonce.near(params[:search][:query],30)).where("statut = ?", "active").page(params[:page]).per_page(9)
        @markers = @annonces.where.not(latitude: nil, longitude: nil).order(created_at: :desc).map do |annonce|
          {
            lat: annonce.latitude,
            lng: annonce.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { annonce: annonce })
          }
        end
      end
    else
      @annonces = policy_scope(Annonce).order(created_at: :desc).page(params[:page]).per_page(9)
      @markers = @annonces.where.not(latitude: nil, longitude: nil).where("statut = ?", "active").order(created_at: :desc).map do |annonce|
        {
          lat: annonce.latitude,
          lng: annonce.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { annonce: annonce })
        }
      end
    end
  end

  def mes_annonces
    @annonces = current_user.annonces
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

  def biens_a_gerer
    @annonces = Annonce.where("agent_user_id = ?", current_user.id.to_s)
    @annonces_agent_en_cours = @annonces.select{ |annonce| annonce.statut != "Loué"}
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

  def checkout_agent
    authorize @annonce
    @annonce.checkout_agent = "check"
    @annonce.save
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
    if @annonce.checkout_agent == "check" && @annonce.checkout_proprio == "check"
      @annonce.statut = "Loué"
      @annonce.save
    end
    redirect_to @annonce
  end

  def show
    authorize @annonce
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
    unless @annonce.agent_user_id.nil?
      @agent = User.find(@annonce.agent_user_id.to_i)
    end
  end

  def new
    authorize @annonce = Annonce.new
    # authorize @photo = Photo.new
  end

  def create
    @annonce = Annonce.new(annonce_params)
    @annonce.user = current_user
    @annonce.statut = "active"
    authorize @annonce
    if @annonce.save
      # for multiple upload photo
      # create_pictures
      redirect_to @annonce
    else
      render :new
    end
  end

  def edit
    authorize @annonce
  end

  def update
    authorize @annonce
    if @annonce.update(annonce_params)
      redirect_to @annonce
    else
      render :edit
    end
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
      :titre_annonce,
      :type_de_bien,
      :meublé,
      :surface,
      :pièces,
      :classe_énergie,
      :ges,
      :description,
      :loyer_mensuel,
      :adresse,
      :ville,
      :email,
      :téléphone,
      :photo,
      :photo1,
      :photo2,
      :photo3,
      :photo4
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
