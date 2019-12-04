class AgentsController < ApplicationController
  before_action :set_agent, only: [:show, :edit, :update, :destroy, :accept_agent, :decline_agent]

  def index
    @agents = policy_scope(Agent).order(created_at: :desc)
    @agent_candidature_reçue = @agents.select{ |c| c.statut == "En cours de traitement" }
    @agent_candidature_approuvé = @agents.select{ |c| c.statut == "Approuvé" }
    @agent_candidature_rejeté = @agents.select{ |c| c.statut == "Rejeté" }

  end

  def new
    authorize @agent = Agent.new
    authorize @availability = Availability.new
    @availabilities = Availability.where("user_id = ?", current_user.id)
    @availability = Availability.where("user_id = ? && jours = ?", current_user.id, params[:jours])
  end

  def create
    @agent = Agent.new(agent_params)
    authorize @agent
    @agent.user = current_user
    @agent.statut = "En cours de traitement"
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    if @agent.save
      # Create a notification
      # Notification.create(recipient: @admin, actor: current_user, action: "candidature_become_agent_RB", notifiable: @agent)
      # Send email to Admin RB
      mail_admin = AgentMailer.with(agent: @agent).candidature_become_agent_RB
      mail_admin.deliver_now
      # Send email confirmation with procedure to become auto-entrepreneur
      mail_agent = AgentMailer.with(agent: @agent).confirmation_become_agent_RB
      mail_agent.deliver_now
      redirect_to profile_path(current_user)
    else
      render :new
    end
  end

  def edit
    authorize @agent
    @availabilities = Availability.where("user_id = ?", current_user.id)
    @availability = Availability.where("user_id = ? && jours = ?", current_user.id, params[:jours])
  end

  def update
    authorize @agent
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    if @agent.update(agent_params)
      # Create a notification
      # Notification.create(recipient: @admin, actor: current_user, action: "candidature_update_agent_RB", notifiable: @agent)
      # Send email to Admin RB
      mail = AgentMailer.with(agent: @agent).candidature_update_agent_RB
      mail.deliver_now
      redirect_to profile_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    authorize @agent
    @agent.destroy
    redirect_to profile_path(current_user)
  end

  def accept_agent
    authorize @agent
    @agent.statut = "Approuvé"
    @agent.user.statut = "Agent"
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    @agent.save
    @agent.user.save
    # Create a notification
    Notification.create(recipient: @agent.user, actor: @admin, action: "candidature_accept_agent_RB", notifiable: @agent)
    # Send email
    # mail = AgentMailer.with(agent: @agent).candidature_accept_agent_RB
    # mail.deliver_now
    redirect_to agents_path
  end

  def decline_agent
    authorize @agent
    @agent.statut = "Rejeté"
    @agent.user.statut = nil
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    @agent.user.save
    @agent.save
    # Create a notification
    Notification.create(recipient: @agent.user, actor: @admin, action: "candidature_decline_agent_RB", notifiable: @agent)
    # Send email
    # mail = AgentMailer.with(agent: @agent).candidature_decline_agent_RB
    # mail.deliver_now
    redirect_to agents_path
  end

  private

  def agent_params
    params.require(:agent).permit(
      :justif_entrepreneur,
      :date_de_naissance,
      :auto_entrepreneur,
      :experience,
      :connaissance
    )
  end

  def set_agent
    @agent = Agent.find(params[:id])
  end
end
