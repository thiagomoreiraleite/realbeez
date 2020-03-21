class ApplicationController < ActionController::Base
  after_action :return_errors, only: [:page_not_found, :server_error]

  def page_not_found
    @status = 404
    @layout = "application"
    @template = "not_found_error"
  end

  def server_error
    @status = 500
    @layout = "error"
    @template = "internal_server_error"
  end

  # force_ssl
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exceptions

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nom, :prénom, :ville, :parrain])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:civilité, :nom, :prénom, :pseudo, :adresse, :ville, :dispo_jours, :dispo_heures, :email, :téléphone, :photo ])
  end

  include Pundit
  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def return_errors
    respond_to do |format|
      format.html { render template: 'errors/' + @template, layout: 'layouts/' + @layout, status: @status }
      format.all  { render nothing: true, status: @status }
    end
  end


end
