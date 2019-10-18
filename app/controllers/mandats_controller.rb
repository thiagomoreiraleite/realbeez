class MandatsController < ApplicationController
  before_action :set_mandat, only: [:show, :edit, :update]

  def show
    authorize @mandat
    @candidature = @mandat.candidature
  end

  def new
    authorize @mandat = Mandat.new
    @candidature = Candidature.find(params[:candidature_id])
  end

  def create
    authorize @mandat = Mandat.new(mandat_params)
    @candidature = Candidature.find(params[:candidature_id])
    @mandat.user = @candidature.annonce.user
    @mandat.candidature = @candidature
    if @mandat.save
      if @candidature.annonce.user == current_user
        redirect_to candidature_proprio_path
      elsif @candidature.user == current_user
        redirect_to candidature_agent_path
      end
    else
      render :new
    end
  end

  def edit
    authorize @mandat
    @candidature = Candidature.find(@mandat.candidature_id)
  end

  def update
    authorize @mandat
    @candidature = Candidature.find(@mandat.candidature_id)
    if @mandat.update(mandat_params)
      if @candidature.annonce.user == current_user
        redirect_to candidature_proprio_path
      elsif @candidature.user == current_user
        redirect_to candidature_agent_path
      end
    else
      render :new
    end
  end

  private

  def mandat_params
    params.require(:mandat).permit(
      :acceptation_proprio,
      :acceptation_agent,
    )
  end

  def set_mandat
    @mandat = Mandat.find(params[:id])
  end

end
