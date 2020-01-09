class ParrainsController < ApplicationController

  def new
    authorize @parrain = Parrain.new
  end

  def create
    authorize @parrain = Parrain.new(parrain_params)
    @parrain.user_id = current_user.id
    if @parrain.save
      # Send email to Filleul
      mail_filleul = ParrainMailer.with(parrain: @parrain).parrain_notify_filleul
      mail_filleul.deliver_now
      redirect_to confirmation_parrainage_path
    else
      render :new
    end
  end

  def confirmation_parrainage
    skip_authorization
  end

  private

  def parrain_params
    params.require(:parrain).permit(:nom, :prenom, :email)
  end
end
