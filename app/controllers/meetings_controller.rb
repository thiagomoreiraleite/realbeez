class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = policy_scope(Meeting).order(created_at: :asc)
    @meetings_current_user_all = policy_scope(Meeting.where("user_id = ?", current_user.id)).order(start_time: :asc)
    @meetings_agent = []
    @meetings_current_user_all.each do |meeting|
      if meeting.user != meeting.annonce.user
        @meetings_agent << meeting
      end
    end
    @meetings_proprio_unsorted = []
    current_user.annonces.each do |annonce|
      annonce.meetings.each do |meeting|
        @meetings_proprio_unsorted << meeting
      end
    end
    @meetings_proprio = @meetings_proprio_unsorted.sort_by { |meeting| meeting.start_time }
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    authorize @meeting
  end

  # GET /meetings/new
  def new
    authorize @meeting = Meeting.new
    @annonces_agent = Annonce.where("agent_user_id = ? AND statut = ?", current_user.id.to_s, "active")
    @annonces_proprio = Annonce.where("user_id = ? AND statut = ?", current_user, "active")
    @annonces = []
    @annonces_agent.each do |annonce|
      @annonces << annonce
    end
    @annonces_proprio.each do |annonce|
      @annonces << annonce
    end
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
    respond_to do |format|
      if @meeting.save
        if @meeting.annonce.user != @meeting.user
          # Create a notification
          Notification.create(recipient: @meeting.annonce.user, actor: current_user, action: "visit_agent", notifiable: @meeting)
          # Send email
          mail = MeetingMailer.with(meeting: @meeting).visit_agent
          mail.deliver_now
        end
        format.html { redirect_to @meeting, notice: 'La visite a été ajoutée.' }
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
        format.html { redirect_to @meeting, notice: 'La visite a été modifiée.' }
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
    if @meeting.annonce.user == @meeting.user
      respond_to do |format|
        format.html { redirect_to meetings_url(visites: {from: 'proprio'}), notice: 'La visite a été supprimée.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to meetings_url, notice: 'La visite a été supprimée.' }
        format.json { head :no_content }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def meeting_params
    params.require(:meeting).permit(:name, :start_time, :end_time, :nom_prospect, :prenom_prospect, :email, :telephone)
  end
end
