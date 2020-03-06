class MandatsController < ApplicationController
  before_action :set_mandat, only: [:show, :edit, :update]

  def show
    authorize @mandat
    @annonce = @mandat.annonce
  end

  def new
    authorize @mandat = Mandat.new
    @annonce = Annonce.find(params[:annonce_id])
  end

  def create
    authorize @mandat = Mandat.new(mandat_params)
    @annonce = Annonce.find(params[:annonce_id])
    @mandat.user = @annonce.user
    @mandat.annonce = @annonce
    if @mandat.save
      if @annonce.email_proprio != "" && @annonce.agent == "Oui"
        # NOTIFICATION
        # Send to proprio if registered
        @proprio_array = User.where("email = ? ", @annonce.email_proprio)
        @proprio_user = User.where("email = ? ", @annonce.email_proprio)[0]
        if @proprio_array != []
          Notification.create(recipient: @proprio_user, actor: current_user, action: "create_mandat_notify_proprio", notifiable: @mandat)
        end
      end
      # Send email to proprio
      mail_agent = MandatMailer.with(mandat: @mandat).create_mandat_notify_proprio
      mail_agent.deliver_now
      redirect_to annonce_path(@annonce)
    else
      render :new
    end
  end

  def edit
    authorize @mandat
    @annonce = Annonce.find(@mandat.annonce_id)
  end

  def update
    authorize @mandat
    @annonce = Annonce.find(@mandat.annonce_id)
    if @mandat.update(mandat_params)
      redirect_to annonce_path(@annonce)
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
