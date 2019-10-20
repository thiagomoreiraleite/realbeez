class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = policy_scope(Meeting).order(created_at: :desc)
    @meetings_agent = policy_scope(Meeting.where("user_id = ?", current_user.id)).order(start_time: :asc)
    @meetings_proprio = current_user.annonces.map{|a| a.meetings}
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    authorize @meeting
  end

  # GET /meetings/new
  def new
    authorize @meeting = Meeting.new
    @annonces = Annonce.where("agent_user_id = ?", current_user.id.to_s)
  end

  # GET /meetings/1/edit
  def edit
    authorize @meeting
  end

  # POST /meetings
  # POST /meetings.json
  def create
    authorize @meeting = Meeting.new(meeting_params)
    @meeting.user_id = current_user.id
    @meeting.annonce_id = params[:meeting][:annonce_id]
    # Create a notification
    Notification.create(recipient: @meeting.annonce.user, actor: current_user, action: "visit_agent", notifiable: @meeting)
    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    authorize @meeting
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    authorize @meeting
    @meeting.destroy
    # In case a meeting is deleted, need to delete also all notification linked to it
    @notifications = Notification.where("notifiable_id = ?", @meeting)
    @notifications.each do |notification|
      notification.destroy
      notification.save
    end
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def meeting_params
    params.require(:meeting).permit(:name, :start_time, :end_time)
  end
end
