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
  end

  def create
    @agent = Agent.new(agent_params)
    authorize @agent
    @agent.user = current_user
    @agent.statut = "En cours de traitement"
    if @agent.save
      redirect_to profile_path(current_user)
    else
      render :new
    end
  end

  def edit
    authorize @agent
    @availabilities = Availability.where("user_id = ?", current_user.id)
  end

  def update
    authorize @agent
    if @agent.update(agent_params)
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
    @agent.save
    redirect_to agents_path
  end

  def decline_agent
    authorize @agent
    @agent.statut = "Rejeté"
    @agent.save
    redirect_to agents_path
  end

  private

  def agent_params
  params.require(:agent).permit(
    :cv,
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
