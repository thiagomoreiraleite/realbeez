class AnnoncesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_annonce, only: [:show, :edit, :update, :destroy]

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
        @annonces = policy_scope(Annonce).order(created_at: :desc)
        @markers = @annonces.where.not(latitude: nil, longitude: nil).map do |annonce|
          {
            lat: annonce.latitude,
            lng: annonce.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { annonce: annonce })
          }
        end
      else
        @annonces = policy_scope(Annonce.near(params[:search][:query],20))
        @markers = @annonces.where.not(latitude: nil, longitude: nil).map do |annonce|
          {
            lat: annonce.latitude,
            lng: annonce.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { annonce: annonce })
          }
        end
      end
    else
      @annonces = policy_scope(Annonce).order(created_at: :desc)
      @markers = @annonces.where.not(latitude: nil, longitude: nil).map do |annonce|
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
    @markers = @annonces.where.not(latitude: nil, longitude: nil).map do |annonce|
      {
        lat: annonce.latitude,
        lng: annonce.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { annonce: annonce })
      }
    end
    authorize @annonces
  end

  def show
    authorize @annonce
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
    :photo1
  )
  end

  # def photo_params
  #   params.require(:photo).permit(:photo1, :photo2, :photo3, :photo4, :photo5)
  # end

  def set_annonce
    @annonce = Annonce.find(params[:id])
  end


end
