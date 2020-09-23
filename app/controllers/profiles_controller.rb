class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_profile, only: [:add_friend, :accept_friend, :decline_friend]

  def index
    if params.key?(:search)
      if params[:search][:distance] == "" || params[:search][:distance] == nil
        @distance = 30
      else
        @distance = params[:search][:distance].to_i
      end
      if params[:search][:query].empty?
        @profiles = policy_scope(Profile.where("statut = ?", "Agent")).order(created_at: :desc).page(params[:page]).per_page(18)
        @markers = @profiles.where.not(latitude: nil, longitude: nil).map do |profile|
          {
            lat: profile.latitude,
            lng: profile.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { profile: profile })
          }
        end
      else
        if policy_scope(Profile.where("statut = ?", "Agent").near(params[:search][:query],@distance)) != []
          @profiles = policy_scope(Profile.where("statut = ?", "Agent").near(params[:search][:query],@distance)).page(params[:page]).per_page(18)
          @markers = @profiles.where.not(latitude: nil, longitude: nil).map do |profile|
            {
              lat: profile.latitude,
              lng: profile.longitude,
              infoWindow: render_to_string(partial: "info_window", locals: { profile: profile })
            }
          end
        else
          @profiles = policy_scope(Profile.where("statut = ?", "Agent").near(params[:search][:query],@distance)).page(params[:page]).per_page(18)
          @profiles_no_result = policy_scope(Profile.where("statut = ?", "Agent").search_agent("paris")).page(params[:page]).per_page(18)
          @markers = @profiles_no_result.where.not(latitude: nil, longitude: nil).map do |profile|
            {
              lat: profile.latitude,
              lng: profile.longitude,
              infoWindow: render_to_string(partial: "info_window", locals: { profile: profile })
            }
          end
        end
      end
    elsif params.key?(:search_all)
      if params[:search_all][:query].empty?
        @profiles = policy_scope(Profile.where("statut = ?", "Agent")).order(created_at: :desc).page(params[:page]).per_page(18)
        @markers = @profiles.where.not(latitude: nil, longitude: nil).map do |profile|
          {
            lat: profile.latitude,
            lng: profile.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { profile: profile })
          }
        end
      else
        if policy_scope(Profile.where("statut = ?", "Agent").search_agent(params[:search_all][:query])) != []
          @profiles = policy_scope(Profile.where("statut = ?", "Agent").search_agent(params[:search_all][:query])).page(params[:page]).per_page(18)
          @markers = @profiles.where.not(latitude: nil, longitude: nil).map do |profile|
            {
              lat: profile.latitude,
              lng: profile.longitude,
              infoWindow: render_to_string(partial: "info_window", locals: { profile: profile })
            }
          end
        else
          @profiles = policy_scope(Profile.where("statut = ?", "Agent").search_agent(params[:search_all][:query])).page(params[:page]).per_page(18)
          @profiles_no_result = policy_scope(Profile.where("statut = ?", "Agent").search_agent("paris")).page(params[:page]).per_page(18)
          @markers = @profiles_no_result.where.not(latitude: nil, longitude: nil).map do |profile|
            {
              lat: profile.latitude,
              lng: profile.longitude,
              infoWindow: render_to_string(partial: "info_window", locals: { profile: profile })
            }
          end
        end
      end
    else
      @profiles = policy_scope(Profile.where("statut = ?", "Agent" )).order(created_at: :desc).page(params[:page]).per_page(18)
      @markers = @profiles.where.not(latitude: nil, longitude: nil).map do |profile|
        {
          lat: profile.latitude,
          lng: profile.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { profile: profile })
        }
      end
    end
  end
  # end

  def profile_all_users
    if params.key?(:search_profile)
      if params[:search_profile][:query].empty?
        authorize @profiles = Profile.all.order(created_at: :desc).page(params[:page]).per_page(40)
        @markers = @profiles.where.not(latitude: nil, longitude: nil).map do |profile|
          {
            lat: profile.latitude,
            lng: profile.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { profile: profile })
          }
        end
      else
        authorize @profiles = Profile.search_profile(params[:search_profile][:query]).page(params[:page]).per_page(40)
        @markers = @profiles.where.not(latitude: nil, longitude: nil).map do |profile|
          {
            lat: profile.latitude,
            lng: profile.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { profile: profile })
          }
        end
      end
    else
      authorize @profiles = Profile.all.order(created_at: :desc).page(params[:page]).per_page(40)
      @markers = @profiles.where.not(latitude: nil, longitude: nil).map do |profile|
        {
          lat: profile.latitude,
          lng: profile.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { profile: profile })
        }
      end
    end
  end

  def my_friends
    @profiles = current_user.friends
    authorize @profiles
  end

  def show
    @profile = User.find(params[:id])
    authorize @profile
    @profiles = []
    @profiles << @profile
    @markers = @profiles.map do |profile|
      {
        lat: profile.latitude,
        lng: profile.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { profile: profile })
      }
    end
    if user_signed_in?
      @annonces= Annonce.where("statut = ? AND user_id = ?", "active", current_user.id).select{ |annonce| annonce.agent_user_id == nil}
    end
    @profiles = @profile.friends
    @candidature = Candidature.new
    @meetings = policy_scope(Meeting.where("user_id = ?", @profile.id)).order(start_time: :desc)
    @meeting = Meeting.new
    @availabilities = Availability.where("user_id = ?", @profile.id)
    @availability = Availability.where("user_id = ? && jours = ?", @profile.id, params[:jours])
    # RATINGS
    unless @profile.agent == [] || @profile.agent == nil
      unless @profile.agent.reviews ==[] || @profile.agent == [] || @profile.agent == nil
        @sum_ratings = @profile.agent.reviews.inject(0) {|sum, i|  sum + i.rating }.to_f
        @nb_ratings = @profile.agent.reviews.count.to_f
        @average_ratings = (@sum_ratings/@nb_ratings)
        @full_stars = @average_ratings.to_i
        @half_full_stars = (@average_ratings - @full_stars) == 0 ? 0 : 1
        @empty_stars = 5 - @full_stars - @half_full_stars
        @reviews = @profile.agent.reviews.order(created_at: :desc)
      end
    end
    # Appartment managed by the agent
    @annonce_en_cours = Annonce.where("agent_user_id = ? AND statut = ?", params[:id].to_s, "active" ).order(created_at: :desc)
    @annonce_rented = Annonce.where("agent_user_id = ? AND statut = ?", params[:id].to_s, "Loué" ).order(created_at: :desc)
  end

  def add_friend
    current_user.friend_request(@profile)
    redirect_to profiles_path
  end

  def accept_friend
    current_user.accept_request(@profile)
    redirect_to my_friends_path
  end

  def decline_friend
    current_user.decline_request(@profile)
    redirect_to my_friends_path
  end

  private

  def set_profile
    authorize @profile = Profile.find(params[:id])
  end
end
