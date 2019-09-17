class AvailabilitiesController < ApplicationController

    before_action :set_availability, only: [:edit, :update]

  def new
    authorize @availability = Availability.new
  end

  # def create
  #   @availability = Availability.new(availability_params)
  #   @availability.user = current_user
  #   @availability.heures = params[:availability][:heures]
  #   authorize @availability
  #   if @availability.save
  #     redirect_to profile_path(current_user)
  #   else
  #     render :new
  #   end
  # end

  def create
    @availability = Availability.new
    @availability.user = current_user
    @availability.jours = params[:jours]
    authorize @availability
    if @availability.save
      redirect_to profile_path(current_user)
    end
  end

   def edit
    authorize @availability
  end

  def update
    authorize @availability
    @availability.heures = params[:availability][:heures]
    if @availability.update(availability_params)
      redirect_to profile_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @availabilities = Availability.all
    @availability = @availabilities.select{|a| a.user_id == current_user.id && a.jours == params[:jours]}[0]
    authorize @availability
    @availability.destroy
    redirect_to profile_path(current_user)
  end

private

  def availability_params
    params.require(:availability).permit(:jours, :heures)
  end

  def set_availability
    @availability = Availability.find(params[:id])
  end

end
