class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_profile, only: [:add_friend, :accept_friend, :decline_friend]

  def index
    if params.key?(:search)
      if params[:search][:query].empty?
        @profiles = policy_scope(Profile.where("statut = ?", "Agent" )).order(created_at: :desc)
        @markers = @profiles.where.not(latitude: nil, longitude: nil).map do |profile|
          {
            lat: profile.latitude,
            lng: profile.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { profile: profile })
          }
        end
      else
        @profiles = policy_scope(Profile.where("statut = ?", "Agent" ).near(params[:search][:query],20))
        @markers = @profiles.where.not(latitude: nil, longitude: nil).map do |profile|
          {
            lat: profile.latitude,
            lng: profile.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { profile: profile })
          }
        end
      end
    else
      @profiles = policy_scope(Profile.where("statut = ?", "Agent" )).order(created_at: :desc)
      @markers = @profiles.where.not(latitude: nil, longitude: nil).map do |profile|
        {
          lat: profile.latitude,
          lng: profile.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { profile: profile })
        }
      end
    end
  end

  def profile_all_users
    if params.key?(:search_profile)
      if params[:search_profile][:query].empty?
        authorize @profiles = Profile.all.order(created_at: :desc)
        @markers = @profiles.where.not(latitude: nil, longitude: nil).map do |profile|
          {
            lat: profile.latitude,
            lng: profile.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { profile: profile })
          }
        end
      else
        authorize @profiles = Profile.search_profile(params[:search_profile][:query])
        @markers = @profiles.where.not(latitude: nil, longitude: nil).map do |profile|
          {
            lat: profile.latitude,
            lng: profile.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { profile: profile })
          }
        end
      end
    else
      authorize @profiles = Profile.all.order(created_at: :desc)
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
    @annonces= Annonce.where("statut = ? AND user_id = ?", "active", current_user.id).select{ |annonce| annonce.agent_user_id == nil}
    @profiles = @profile.friends
    @candidature = Candidature.new
    @meetings = policy_scope(Meeting.where("user_id = ?", @profile.id)).order(start_time: :desc)
    @meeting = Meeting.new
    @availabilities = Availability.where("user_id = ?", @profile.id)
    @availability = Availability.where("user_id = ? && jours = ?", @profile.id, params[:jours])
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
