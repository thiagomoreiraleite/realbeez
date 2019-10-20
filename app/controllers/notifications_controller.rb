class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_notification, only: [:destroy]

  def index
    @notifications = policy_scope(Notification.where("recipient_id = ?", current_user.id)).unread
  end

  def all_notifications
    authorize @notifications = policy_scope(Notification.where("recipient_id = ?", current_user.id))
  end

  def destroy
    authorize @notification
    @notification.destroy
    @notification.save
    redirect_to all_notifications_path
  end

  def mark_as_read
    authorize @notifications = Notification.where("recipient_id = ?", current_user.id).unread
    # @notifications.update.all(read_at: Time.zone.now)
    @notifications.each do |notification|
      notification.read_at = Time.now
      notification.save
    end
    render json: {success: true}
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end

end
